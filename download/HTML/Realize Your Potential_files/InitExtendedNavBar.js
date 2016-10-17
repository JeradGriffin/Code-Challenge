$smjquery(function () {
    function findMatchingLink(ul) {
        var previous = ul.prev();
        if (typeof previous !== 'undefined') {
            // Verify the previous element is what we expected.
            if (previous.attr("title") == ul.attr("aria-labelledby"))
                return previous;
        }
        return null;
    }

    $smjquery('#main-menu').smartmenus({
        subMenusSubOffsetX: 1,
        subMenusSubOffsetY: -8,
        showFunction: function (item, complete) {
            item.show(this.opts.showDuration, complete);
            item.attr("aria-expanded", "true");

            var link = findMatchingLink(item);
            if (link != null) {
                link.attr("aria-expanded", "true")
            }
        },
        hideFunction: function (item, complete) {
            item.hide(this.opts.showDuration, complete);
            item.attr("aria-expanded", "false");

            var link = findMatchingLink(item);
            if (link != null) {
                link.attr("aria-expanded", "false")
            }
        }
    });
    $smjquery('#main-menu').smartmenus('keyboardSetHotkey', '123', 'shiftKey');
});
