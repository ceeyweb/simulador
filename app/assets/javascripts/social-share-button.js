(function() {
  window.SocialShareButton = {
    openUrl: function(url, width, height) {
      var left, opt, top;
      if (width == null) {
        width = 640;
      }
      if (height == null) {
        height = 480;
      }
      left = (screen.width / 2) - (width / 2);
      top = (screen.height * 0.3) - (height / 2);
      opt = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",menubar=no,status=no,location=no";
      window.open(url, 'popup', opt);
      return false;
    },
    share: function(el) {
      var $parent, appkey, desc, ga, get_tumblr_extra, hashtags, img, site, title, tumblr_params, url, via, via_str, whatsapp_app_url;
      if (el.getAttribute === null) {
        el = document.querySelector(el);
      }
      site = el.getAttribute("data-site");
      appkey = el.getAttribute("data-appkey") || '';
      $parent = el.parentNode;
      title = encodeURIComponent(el.getAttribute("data-" + site + "-title") || $parent.getAttribute('data-title') || '');
      img = encodeURIComponent($parent.getAttribute("data-img") || '');
      url = encodeURIComponent($parent.getAttribute("data-url") || '');
      via = encodeURIComponent($parent.getAttribute("data-via") || '');
      desc = encodeURIComponent($parent.getAttribute("data-desc") || ' ');
      ga = window[window['GoogleAnalyticsObject'] || 'ga'];
      if (typeof ga === 'function') {
        ga('send', 'event', 'Social Share Button', 'click', site);
      }
      if (url.length === 0) {
        url = encodeURIComponent(location.href);
      }
      switch (site) {
        case "email":
          location.href = "mailto:?to=&subject=" + title + "&body=" + url;
          break;
        case "x":
          hashtags = encodeURIComponent(el.getAttribute("data-" + site + "-hashtags") || $parent.getAttribute("data-hashtags") || '');
          via_str = '';
          if (via.length > 0) {
            via_str = "&via=" + via;
          }
          SocialShareButton.openUrl("https://x.com/intent/tweet?url=" + url + "&text=" + title + "&hashtags=" + hashtags + via_str, 650, 300);
          break;
        case "facebook":
          SocialShareButton.openUrl("http://www.facebook.com/sharer/sharer.php?u=" + url, 555, 400);
          break;
        case "pinterest":
          SocialShareButton.openUrl("http://www.pinterest.com/pin/create/button/?url=" + url + "&media=" + img + "&description=" + title);
          break;
        case "linkedin":
          SocialShareButton.openUrl("https://www.linkedin.com/shareArticle?mini=true&url=" + url + "&title=" + title + "&summary=" + desc);
          break;
        case "reddit":
          SocialShareButton.openUrl("http://www.reddit.com/submit?url=" + url + "&newwindow=1", 555, 400);
          break;
        case "telegram":
          SocialShareButton.openUrl("https://telegram.me/share/url?text=" + title + "&url=" + url);
          break;
        case "whatsapp_app":
          whatsapp_app_url = "whatsapp://send?text=" + title + "%0A" + url;
          window.open(whatsapp_app_url, '_top');
          break;
        case "whatsapp_web":
          SocialShareButton.openUrl("https://web.whatsapp.com/send?text=" + title + "%0A" + url);
        case "instagram":
          SocialShareButton.openUrl("https://www.instagram.com/ceey_mx");
          break;
      }
      return false;
    }
  };

}).call(this);
