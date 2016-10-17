FixTabIndex = {
    RegisteredRefreshHandler: false,
    SkipNavFocus: -1,

	FixPage: function () {
		if (typeof (jQuery) == 'undefined')
		{
            // console isn't defined until developer tools are opened in IE8
            if (typeof(console) !== 'undefined')
    			console.warn('Core.UI.TabIndex requires jQuery');
			return;
		}

		if (!this.RegisteredRefreshHandler) {
		    var doc = jQuery(document);
		    if (doc.on)
		        doc.on('RefreshTabIndex', function () { FixTabIndex.FixPage(); });
		    else if (doc.live)
		        doc.live('RefreshTabIndex', function () { FixTabIndex.FixPage(); });
		    else
		        doc.bind('RefreshTabIndex', function () { FixTabIndex.FixPage(); });
            this.RegisteredRefreshHandler = true;
		}
        
		jQuery(".csod-skipnav").click(function () { var content = jQuery('[name=content]'); setTimeout(function () { content.attr('tabindex', FixTabIndex.SkipNavFocus); }, 100); })
            .focus(function () { jQuery('[name=content]').attr('tabindex', '-1'); });

		var elementQueue = [jQuery('body')[0]];
		var maxTabIndex = 0;

		var atContent = false;
		var element;
		while ((element = elementQueue.pop()) !== undefined) {
		    var object = jQuery(element);

		    if (object.is('[name=content]'))
		        atContent = true;
			// data-tabindex-fix-mode = "offset" - Update the children to be offset of the highest recent (default)
			// data-tabindex-fix-mode = "increment" - Update the children to increment from the highest recent
			// data-tabindex-fix - Base tabindex to be used during the fix, ignored if mode is "increment"
			var fixMode = object.attr('data-tabindex-fix-mode');
			if (fixMode !== undefined) {
			    var elementsToFix = object.find('[data-tabindex-fix]');
			    if (object.is('[data-tabindex-fix]'))
			        elementsToFix.add(object);
				var newMaxTabIndex = maxTabIndex;

				if (fixMode == 'increment') {
				    elementsToFix.each(function (index, element) {
				        if (jQuery(element).attr('tabindex') == '-1')
				            return;
						++newMaxTabIndex;
						jQuery(element).attr('tabindex', newMaxTabIndex);
					});
					if (atContent && elementsToFix.length > 0) {
					    this.SkipNavFocus = jQuery(elementsToFix[0]).attr('tabindex');
					    atContent = false;
					}
                }
				else {
				    var minTabIndex = 0;
				    var minTabIndexElement = null;
					elementsToFix.each(function (index, element) {
					    var tabIndex = parseInt(jQuery(element).attr('data-tabindex-fix')) + maxTabIndex;
					    if (jQuery(element).attr('tabindex') == '-1')
					        return;
					    jQuery(element).attr('tabindex', tabIndex);
						if (tabIndex > newMaxTabIndex)
						    newMaxTabIndex = tabIndex;
						if (minTabIndexElement == null || tabIndex < minTabIndex) {
						    minTabIndex = tabIndex;
						    minTabIndexElement = element;
						}
					});
					if (atContent && minTabIndexElement != null) {
					    this.SkipNavFocus = minTabIndex;
					    atContent = false;
					}
                }

				maxTabIndex = newMaxTabIndex;
			}
			else {
				var children = object.children();

				if (children.length > 0)
					for (var i = children.length - 1; i >= 0; --i)
						elementQueue.push(children[i]);

				var tabIndexString = object.attr('tabindex');
				if (tabIndexString !== undefined) {
					var tabIndex = parseInt(tabIndexString);
					if (tabIndex > maxTabIndex)
					    maxTabIndex = tabIndex;
					if (atContent && tabIndex > 0) {
					    this.SkipNavFocus = tabIndex;
					    atContent = false;
					}

				}
			}
		}
	}
};