// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var Ad, AdSense,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

AdSense = (function() {
  function AdSense(ad_client) {
    var _this = this;
    this.ad_client = ad_client;
    this.initPage = __bind(this.initPage, this);
    if (typeof google !== "undefined" && google !== null) {
      google.load('ads', '1');
      google.setOnLoadCallback(this.initPage);
      this.ads = {};
      $(document).on('page:fetch', function() {
        return _this.clearAds();
      });
      $(document).on('page:load', function() {
        return _this.initPage();
      });
    }
  }

  AdSense.prototype.initPage = function() {
    var ad, id, _ref, _results;
    _ref = this.ads;
    _results = [];
    for (id in _ref) {
      ad = _ref[id];
      _results.push(ad.load());
    }
    return _results;
  };

  AdSense.prototype.clearAds = function() {
    this.ads = {};
    if (window.google_prev_ad_slotnames_by_region) {
      window.google_prev_ad_slotnames_by_region[''] = '';
    }
    return window.google_num_ad_slots = 0;
  };

  AdSense.prototype.newAd = function(container, options) {
    var id;
    id = (options.format || 'ad') + '_' + container.id;
    return this.ads[id] = new Ad(this, id, container, options);
  };

  return AdSense;

})();

Ad = (function() {
  function Ad(adsense, id, container, options) {
    this.adsense = adsense;
    this.id = id;
    this.container = container;
    this.options = options;
  }

  Ad.prototype.load = function() {
    if (this.ad_object != null) {
      return this.refresh();
    } else {
      return this.create();
    }
  };

  Ad.prototype.refresh = function() {
    return this.ad_object.refresh();
  };

  Ad.prototype.create = function() {
    return this.ad_object = new google.ads.Ad(this.adsense.ad_client, this.container, this.options);
  };

  return Ad;

})();
window.MyAdSense = new AdSense("ca-pub-8742083424682828");