﻿Type.registerNamespace("Sys.Extended.UI.Animation");Sys.Extended.UI.Animation.AnimationBehavior=function(n){Sys.Extended.UI.Animation.AnimationBehavior.initializeBase(this,[n]);this._onLoad=null;this._onClick=null;this._onMouseOver=null;this._onMouseOut=null;this._onHoverOver=null;this._onHoverOut=null;this._onClickHandler=null;this._onMouseOverHandler=null;this._onMouseOutHandler=null};Sys.Extended.UI.Animation.AnimationBehavior.prototype={initialize:function(){Sys.Extended.UI.Animation.AnimationBehavior.callBaseMethod(this,"initialize");var n=this.get_element();n&&(this._onClickHandler=Function.createDelegate(this,this.playOnClick),$addHandler(n,"click",this._onClickHandler),this._onMouseOverHandler=Function.createDelegate(this,this.playOnMouseOver),$addHandler(n,"mouseover",this._onMouseOverHandler),this._onMouseOutHandler=Function.createDelegate(this,this.playOnMouseOut),$addHandler(n,"mouseout",this._onMouseOutHandler))},dispose:function(){var n=this.get_element();n&&(this._onClickHandler&&($removeHandler(n,"click",this._onClickHandler),this._onClickHandler=null),this._onMouseOverHandler&&($removeHandler(n,"mouseover",this._onMouseOverHandler),this._onMouseOverHandler=null),this._onMouseOutHandler&&($removeHandler(n,"mouseout",this._onMouseOutHandler),this._onMouseOutHandler=null));this._onLoad=null;this._onClick=null;this._onMouseOver=null;this._onMouseOut=null;this._onHoverOver=null;this._onHoverOut=null;Sys.Extended.UI.Animation.AnimationBehavior.callBaseMethod(this,"dispose")},get_onLoad:function(){return this._onLoad?this._onLoad.get_json():null},get_OnLoad:function(){return Sys.Extended.Deprecated("get_OnLoad()","get_onLoad()"),this.get_onLoad()},set_onLoad:function(n){this._onLoad||(this._onLoad=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onLoad.initialize());this._onLoad.set_json(n);this.raisePropertyChanged("OnLoad");this._onLoad.play()},set_OnLoad:function(n){Sys.Extended.Deprecated("set_OnLoad(value)","set_onLoad(value)");this.set_onLoad(n)},get_onLoadBehavior:function(){return this._onLoad},get_OnLoadBehavior:function(){return Sys.Extended.Deprecated("get_OnLoadBehavior()","get_OnLoadBehavior()"),this.get_onLoadBehavior()},get_onClick:function(){return this._onClick?this._onClick.get_json():null},get_OnClick:function(){return Sys.Extended.Deprecated("get_OnClick()","get_onClick()"),this.get_onClick()},set_OnClick:function(n){Sys.Extended.Deprecated("set_OnClick(value)","set_onClick(value)");this.set_onClick(n)},set_onClick:function(n){this._onClick||(this._onClick=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onClick.initialize());this._onClick.set_json(n);this.raisePropertyChanged("OnClick")},get_onClickBehavior:function(){return this._onClick},get_OnClickBehavior:function(){return Sys.Extended.Deprecated("get_OnClickBehavior()","get_onClickBehavior()"),this.get_onClickBehavior()},OnClick:function(){Sys.Extended.Deprecated("OnClick()");this.playOnClick()},playOnClick:function(){this._onClick&&this._onClick.play()},get_onMouseOver:function(){return this._onMouseOver?this._onMouseOver.get_json():null},get_OnMouseOver:function(){return Sys.Extended.Deprecated("get_OnMouseOver()","get_onMouseOver()"),this.get_onMouseOver()},set_onMouseOver:function(n){this._onMouseOver||(this._onMouseOver=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onMouseOver.initialize());this._onMouseOver.set_json(n);this.raisePropertyChanged("OnMouseOver")},set_OnMouseOver:function(n){Sys.Extended.Deprecated("set_OnMouseOver(value)","set_onMouseOver(value)");this.set_onMouseOver(n)},get_onMouseOverBehavior:function(){return this._onMouseOver},get_OnMouseOverBehavior:function(){Sys.Extended.Deprecated("get_OnMouseOverBehavior()","get_onMouseOverBehavior()")},OnMouseOver:function(){Sys.Extended.Deprecated("OnMouseOver()");this.playOnMouseOver()},playOnMouseOver:function(){this._mouseHasEntered||(this._onMouseOver&&this._onMouseOver.play(),this._onHoverOver&&(this._onHoverOut&&this._onHoverOut.quit(),this._onHoverOver.play()),this._mouseHasEntered=!0)},get_onMouseOut:function(){return this._onMouseOut?this._onMouseOut.get_json():null},get_OnMouseOut:function(){return Sys.Extended.Deprecated("get_OnMouseOut()","get_onMouseOut()"),this.get_onMouseOut()},set_onMouseOut:function(n){this._onMouseOut||(this._onMouseOut=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onMouseOut.initialize());this._onMouseOut.set_json(n);this.raisePropertyChanged("OnMouseOut")},set_OnMouseOut:function(n){Sys.Extended.Deprecated("set_OnMouseOut(value)","set_OnMouseOut(value)");this.set_onMouseOut(n)},get_onMouseOutBehavior:function(){return this._onMouseOut},get_OnMouseOutBehavior:function(){return Sys.Extended.Deprecated("get_OnMouseOutBehavior()","get_onMouseOutBehavior"),this.get_onMouseOutBehavior()},OnMouseOut:function(){Sys.Extended.Deprecated("OnMouseOut()");this.playOnMouseOut()},playOnMouseOut:function(n){var r=n.rawEvent,t=this.get_element(),u=n.target,i;u.nodeName===t.nodeName&&(i=r.relatedTarget||r.toElement,t==i||this._isChild(t,i)||(this._mouseHasEntered=!1,this._onMouseOut&&this._onMouseOut.play(),this._onHoverOut&&(this._onHoverOver&&this._onHoverOver.quit(),this._onHoverOut.play())))},_isChild:function(n,t){for(var i=document.body;t&&n!=t&&i!=t;)try{t=t.parentNode}catch(r){return!1}return n==t},get_onHoverOver:function(){return this._onHoverOver?this._onHoverOver.get_json():null},get_OnHoverOver:function(){return Sys.Extended.Deprecated("get_OnHoverOver()","get_onHoverOver"),this.get_onHoverOver()},set_onHoverOver:function(n){this._onHoverOver||(this._onHoverOver=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onHoverOver.initialize());this._onHoverOver.set_json(n);this.raisePropertyChanged("OnHoverOver")},set_OnHoverOver:function(n){Sys.Extended.Deprecated("set_OnHoverOver(value)","set_OnHoverOver(value)");this.set_onHoverOver(n)},get_onHoverOverBehavior:function(){return this._onHoverOver},get_OnHoverOverBehavior:function(){return Sys.Extended.Deprecated("get_OnHoverOverBehavior()","get_onHoverOverBehavior()"),this.get_onHoverOverBehavior()},get_onHoverOut:function(){return this._onHoverOut?this._onHoverOut.get_json():null},get_OnHoverOut:function(){return Sys.Extended.Deprecated("get_OnHoverOut()","get_onHoverOut()"),this.get_onHoverOut()},set_onHoverOut:function(n){this._onHoverOut||(this._onHoverOut=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onHoverOut.initialize());this._onHoverOut.set_json(n);this.raisePropertyChanged("OnHoverOut")},set_OnHoverOut:function(n){Sys.Extended.Deprecated("set_OnHoverOut(value)","set_onHoverOut(value)");this.set_onHoverOut(n)},get_onHoverOutBehavior:function(){return this._onHoverOut},get_OnHoverOutBehavior:function(){return Sys.Extended.Deprecated("get_OnHoverOutBehavior()","get_onHoverOutBehavior()"),this.get_onHoverOutBehavior()}};Sys.Extended.UI.Animation.AnimationBehavior.registerClass("Sys.Extended.UI.Animation.AnimationBehavior",Sys.Extended.UI.BehaviorBase);Sys.Extended.UI.Animation.GenericAnimationBehavior=function(n){Sys.Extended.UI.Animation.GenericAnimationBehavior.initializeBase(this,[n]);this._json=null;this._animation=null};Sys.Extended.UI.Animation.GenericAnimationBehavior.prototype={dispose:function(){this.disposeAnimation();Sys.Extended.UI.Animation.GenericAnimationBehavior.callBaseMethod(this,"dispose")},disposeAnimation:function(){this._animation&&this._animation.dispose();this._animation=null},play:function(){this._animation&&!this._animation.get_isPlaying()&&(this.stop(),this._animation.play())},stop:function(){this._animation&&this._animation.get_isPlaying()&&this._animation.stop(!0)},quit:function(){this._animation&&this._animation.get_isPlaying()&&this._animation.stop(!1)},get_json:function(){return this._json},set_json:function(n){if(this._json!=n){this._json=n;this.raisePropertyChanged("json");this.disposeAnimation();var t=this.get_element();t&&(this._animation=Sys.Extended.UI.Animation.buildAnimation(this._json,t),this._animation&&this._animation.initialize(),this.raisePropertyChanged("animation"))}},get_animation:function(){return this._animation}};Sys.Extended.UI.Animation.GenericAnimationBehavior.registerClass("Sys.Extended.UI.Animation.GenericAnimationBehavior",Sys.Extended.UI.BehaviorBase);