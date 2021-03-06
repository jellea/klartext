// Generated by CoffeeScript 1.3.3
(function() {
  var displayClippings, dropFile, parseClippings, readKindle, selectBooks, shareQuote, showBooks, uploadFiles;

  this.book = $$({
    view: {
      format: '<li><a href="#" data-bind="title"></a></li>'
    },
    controller: {
      'click a': function() {
        var title;
        title = this.model.get('title');
        $('.dropdown-toggle').html("" + title + " <b class=\"caret\"></b>");
        return selectBooks(title);
      }
    }
  });

  this.quote = $$({
    view: {
      format: "<tr>\n <td>\n   <div class=\"share\">\n     <div class=\"overlay\"></div>\n     <div class=\"buttons\">\n       <a id=\"twitter\" class=\"sharebutton\">\n       <svg version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\"\n          width=\"72px\" height=\"72px\" viewBox=\"0 0 512 512\" enable-background=\"new 0 0 512 512\" xml:space=\"preserve\">\n       <path id=\"twitter-icon\" d=\"M462,128.223c-15.158,6.724-31.449,11.269-48.547,13.31c17.449-10.461,30.854-27.025,37.164-46.764\n         c-16.333,9.687-34.422,16.721-53.676,20.511c-15.418-16.428-37.386-26.691-61.698-26.691c-54.56,0-94.668,50.916-82.337,103.787\n         c-70.25-3.524-132.534-37.177-174.223-88.314c-22.142,37.983-11.485,87.691,26.158,112.85c-13.854-0.438-26.891-4.241-38.285-10.574\n         c-0.917,39.162,27.146,75.781,67.795,83.949c-11.896,3.237-24.926,3.978-38.17,1.447c10.754,33.58,41.972,58.018,78.96,58.699\n         C139.604,378.282,94.846,390.721,50,385.436c37.406,23.982,81.837,37.977,129.571,37.977c156.932,0,245.595-132.551,240.251-251.435\n         C436.339,160.061,450.668,145.174,462,128.223z\"/>\n       </svg>\n       </a>\n       <a id=\"facebook\" class=\"sharebutton\">\n       <svg version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\"\n          width=\"72px\" height=\"72px\" viewBox=\"0 0 512 512\" enable-background=\"new 0 0 512 512\" xml:space=\"preserve\">\n       <path id=\"facebook-icon\" d=\"M204.067,184.692h-43.144v70.426h43.144V462h82.965V254.238h57.882l6.162-69.546h-64.044\n         c0,0,0-25.97,0-39.615c0-16.398,3.302-22.89,19.147-22.89c12.766,0,44.896,0,44.896,0V50c0,0-47.326,0-57.441,0\n         c-61.734,0-89.567,27.179-89.567,79.231C204.067,174.566,204.067,184.692,204.067,184.692z\"/>\n       </svg>\n       </a>\n       <a id=\"tumblr\" class=\"sharebutton\">\n       <svg version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\"\n          width=\"72px\" height=\"72px\" viewBox=\"0 0 512 512\" enable-background=\"new 0 0 512 512\" xml:space=\"preserve\">\n       <path id=\"tumblr-icon\" d=\"M212.844,50c-2.626,21.231-7.415,38.703-14.374,52.444c-6.951,13.749-16.175,25.512-27.678,35.315\n         c-11.5,9.8-25.305,17.332-41.435,22.581v58.698h45.115v144.386c0,18.812,1.967,33.167,5.916,43.069\n         c3.94,9.909,11.028,19.265,21.242,28.062c10.207,8.798,22.547,15.568,37.022,20.323c14.461,4.743,31.099,7.121,49.919,7.121\n         c16.582,0,32.008-1.665,46.272-4.988c14.257-3.335,30.195-9.13,47.798-17.415v-64.791c-20.644,13.564-41.393,20.347-62.24,20.347\n         c-11.736,0-22.165-2.729-31.269-8.203c-6.88-4.035-11.59-9.457-14.121-16.239c-2.532-6.781-3.791-22.116-3.791-46.001V219.038\n         h97.835V154.36h-97.835V50H212.844z\"/>\n       </svg>\n       </a>\n       <a id=\"evernote\" class=\"sharebutton\">\n         <svg version=\"1.1\" id=\"Layer_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" width=\"72px\" height=\"72px\" viewBox=\"0 0 720 720\" enable-background=\"new 0 0 2592 720\" xml:space=\"preserve\"><path id=\"evernote-circle-outline-icon\" d=\"M171.582,182.353c0,0,0,0,0.036,0h54.447c3.12,0,5.629-2.541,5.635-5.637c0-0.02-0.661-46.685-0.661-59.662	V116.9c0-10.658,2.237-19.95,6.133-27.737l1.862-3.497c-0.208,0.035-0.417,0.137-0.624,0.345L132.618,190.919	c-0.207,0.17-0.336,0.391-0.396,0.618c2.188-1.083,5.18-2.563,5.603-2.749C147.038,184.631,158.209,182.353,171.582,182.353z M595.25,170.93c-4.325-23.152-18.09-34.562-30.535-39.048c-13.427-4.853-40.653-9.88-74.861-13.912\n       c-27.521-3.241-59.868-2.983-79.407-2.379c-2.345-16.062-13.611-30.736-26.217-35.816c-33.587-13.519-85.48-10.253-98.804-6.519\n       c-10.587,2.959-22.306,9.023-28.828,18.368c-4.374,6.242-7.204,14.239-7.226,25.411c0,6.323,0.176,21.218,0.337,34.452\n       c0.16,13.275,0.334,25.148,0.334,25.229c-0.006,11.819-9.585,21.438-21.456,21.453h-54.456c-11.616,0-20.491,1.952-27.271,5.032\n       c-6.79,3.083-11.599,7.239-15.253,12.156c-7.273,9.764-8.536,21.813-8.506,34.109c0,0,0.107,10.048,2.528,29.496\n       c2.013,15.048,18.332,120.17,33.832,152.141c6.01,12.439,10.013,17.62,21.82,23.103c26.307,11.263,86.396,23.793,114.559,27.381\n       c28.112,3.597,45.756,11.158,56.271-10.889c0.035-0.055,2.106-5.485,4.955-13.451c9.129-27.663,10.399-52.208,10.399-69.97\n       c0-1.806,2.65-1.889,2.65,0c0,12.54-2.395,56.915,31.126,68.82c13.233,4.693,40.685,8.877,68.578,12.146\n       c25.221,2.898,43.524,12.823,43.524,77.529c0,39.367-8.269,44.765-51.495,44.765c-35.04,0-48.395,0.907-48.395-26.931\n       c0-22.499,22.252-20.141,38.744-20.141c7.366,0,2.02-5.479,2.02-19.36c0-13.808,8.636-21.79,0.468-21.992\n       c-57.028-1.569-90.583-0.065-90.583,71.256c0,64.747,24.778,76.77,105.716,76.77c63.46,0,85.83-2.078,112.033-83.381\n       c5.187-16.05,17.726-65.031,25.315-147.271C611.965,367.488,602.644,210.542,595.25,170.93z M484.627,344.405\n       c-7.84-0.274-15.381,0.221-22.413,1.351c1.979-15.983,8.576-35.595,31.946-34.774c25.87,0.89,29.495,25.341,29.587,41.903\n       C512.839,348.021,499.335,344.922,484.627,344.405z\"/>\n     </svg>\n       </a>\n       <a id=\"link\" class=\"sharebutton\">\n         <svg version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" width=\"72px\" height=\"72px\" viewBox=\"0 0 512 512\" enable-background=\"new 0 0 512 512\" xml:space=\"preserve\"><path id=\"link-icon\" d=\"M156.226,199.679c7.541-7.54,15.902-13.757,24.794-18.659c49.556-27.318,113.117-12.788,144.97,35.518 l-38.547,38.547c-11.059-25.227-38.5-39.565-65.813-33.456c-10.282,2.3-20.054,7.427-28.039,15.413l-73.898,73.896 c-22.433,22.433-22.432,58.936,0.002,81.369c22.433,22.433,58.935,22.433,81.368,0l22.78-22.779 c20.71,8.217,42.938,11.508,64.862,9.863l-50.278,50.278c-43.105,43.105-112.991,43.105-156.096,0 c-43.105-43.104-43.106-112.991-0.001-156.096L156.226,199.679z M273.574,82.33l-50.278,50.278 c21.928-1.643,44.152,1.648,64.863,9.865l22.779-22.78c22.434-22.434,58.936-22.434,81.37,0c22.434,22.434,22.434,58.936,0,81.37 l-73.897,73.895c-22.501,22.501-59.061,22.311-81.368,0c-5.202-5.201-9.694-11.678-12.484-18.04l-38.546,38.546 c4.049,6.142,8.261,11.453,13.666,16.858c13.949,13.95,31.698,24.339,52.117,29.251c26.466,6.37,54.823,2.839,79.185-10.592 c8.892-4.903,17.254-11.119,24.794-18.659l73.896-73.895c43.105-43.105,43.105-112.991,0.001-156.097 C386.566,39.225,316.68,39.225,273.574,82.33z\"/></svg>\n       </a>\n     </div>\n   </div>\n   <div class=\"quote\" id=\"" + (Math.random() + Math.random() * Math.random()) + "\">\n     <h2 data-bind=\"text\"/>\n     <div class=\"info\" style=\"display:none;\">\n       <strong data-bind=\"author\"/> in <strong data-bind=\"title\"/>  &sect;  <span data-bind=\"location\"/>\n     </div>\n   </div>\n </td>\n</tr>"
    },
    controller: {
      'hover h2': function() {
        return this.view.$('.info').stop().slideDown();
      },
      'mouseout h2': function() {
        return this.view.$('.info').stop().slideUp();
      },
      'click .sharebutton': function(event) {
        var media;
        console.log(event);
        if (event.target.childElementCount === 0) {
          media = event.target.parentElement.parentElement.id;
        } else {
          media = event.target.parentElement.id;
        }
        console.log(media);
        return shareQuote(media, this);
      },
      'click h2': function() {
        $('.share:visible').fadeOut(200);
        this.view.$('.share').show();
        this.view.$('.share').css('width', '0%');
        return this.view.$('.share').animate({
          'width': '100%'
        }, 350);
      },
      'click .share': function() {
        return this.view.$('.share').fadeOut(200);
      }
    }
  });

  this.quotes = [];

  this.books = {};

  dropFile = function() {
    return console.log(this);
  };

  shareQuote = function(media, message) {
    var author, text, title;
    title = message.model.get('title');
    author = message.model.get('author');
    text = "\"" + message.model.get('text') + "\"";
    return $.ajax({
      type: 'POST',
      url: 'https://www.googleapis.com/urlshortener/v1/url',
      data: "{'longUrl':'http://jellea.github.com/klartext/showquote.html?text=" + (escape(text)) + "&author=" + (escape(author)) + "&title=" + (escape(title)) + "'}",
      contentType: 'application/json',
      processData: false,
      success: function(shorturl) {
        var maxlengthquote, sm;
        sm = {
          link: shorturl.id,
          facebook: "https://www.facebook.com/dialog/feed?\napp_id=152073644937064&\nlink=" + shorturl.id + "&\npicture=http://f.cl.ly/items/0A1R3h3P1Y1v3j3Z2P3E/quotes.png&\nname=" + text + "&\ncaption=" + author + "%20in%20" + title + "&\nredirect_uri=http://jellea.github.com/klartext/posted.html",
          twitter: "http://twitter.com/share?text=" + text + "%20-%20" + author + "%20in%20" + title + "&url=",
          tumblr: "http://www.tumblr.com/share/quote\n?source=" + author + "%20in%20" + title + "\n&quote=" + text
        };
        if (media === 'twitter' && ("" + text + " -" + author + " in " + title).length > 140) {
          maxlengthquote = 140 - shorturl.id.length - 9;
          text = "\"" + (text.substr(0, maxlengthquote)) + "...\" -";
          sm.twitter = "http://twitter.com/share?text=" + text + "&url=" + shorturl.id;
        }
        if (media === 'evernote') {
          console.log(message.view.$('.quote').attr('id'));
          message.view.$('.info').slideDown();
          return Evernote.doClip({
            suggestNotebook: 'quotes',
            providerName: 'Klartext',
            title: "Klartext Quote: " + (text.substr(0, 50)),
            url: shorturl.id,
            contentId: message.view.$('.quote').attr('id'),
            suggestTags: 'kindle, quote, klartext'
          });
        } else if ((typeof exec !== "undefined" && exec !== null)) {
          return exec("open " + sm[media], function(error, stdout, stderr) {
            if (error !== null) {
              return console.log("exec error: " + error);
            }
          });
        } else {
          return window.open(sm[media]);
        }
      }
    });
  };

  parseClippings = function(data) {
    var clip, clipping, clippings, note, _i, _len;
    try {
      fs.unwatchFile(window.path);
    } catch (_error) {}
    $('#dropview').slideUp(500, function() {
      return $(window.frame).animate({
        height: 600,
        width: 900
      }, 350, function() {
        return $('#listview').slideDown(500);
      });
    });
    clippings = data.split('==========');
    window.notes = [];
    for (_i = 0, _len = clippings.length; _i < _len; _i++) {
      clip = clippings[_i];
      if (clip.indexOf("Added on ") !== -1) {
        clipping = clip.split('Added on ');
        note = {};
        note.title = clipping[0].split('\r\n- ')[0].replace('\r\n', '').replace(/\([\w\s.]+\)$/, '');
        books[note.title] = $$(book, {
          'title': note.title
        });
        note.author = clipping[0].split('\r\n- ')[0].replace('\r\n', '').match(/\([\w\s.]+\)$/)[0].replace(/[\(\)]/g, '');
        note.location = clipping[0].split('\r\n-')[1].replace('\r\n', '').replace('|', '').replace('   ', '').replace(' |', '');
        note.text = clipping[1].split('\r\n\r\n')[1].replace('\r\n', '').replace(/^"/, '').replace(/"$/, '');
        window.notes.push(note);
      }
    }
    showBooks();
    return displayClippings(window.notes);
  };

  showBooks = function() {
    var i, _i, _len, _ref, _results;
    _ref = Object.keys(books);
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      i = _ref[_i];
      _results.push($$.document.append(books[i], '#booklist'));
    }
    return _results;
  };

  selectBooks = function(title) {
    var newarray, q, _i, _len, _ref;
    newarray = [];
    _ref = window.notes;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      q = _ref[_i];
      if (q.title === title) {
        newarray.push(q);
      }
    }
    return displayClippings(newarray);
  };

  displayClippings = function(clippings) {
    var clip, key, q, _i, _j, _len, _len1, _ref, _results;
    for (_i = 0, _len = quotes.length; _i < _len; _i++) {
      q = quotes[_i];
      q.destroy();
    }
    _ref = clippings.reverse();
    _results = [];
    for (key = _j = 0, _len1 = _ref.length; _j < _len1; key = ++_j) {
      clip = _ref[key];
      quotes[key] = $$(quote, clip);
      $$.document.append(quotes[key], '#listview table');
      if (key > 100) {
        break;
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  $('#seeall').click(function() {
    return displayClippings(window.notes);
  });

  readKindle = function(path) {
    try {
      return fs.readFile(path, 'utf-8', function(err, data) {
        if (err) {
          console.log(err);
          return fs.watchFile(path, function(curr, prev) {
            return readKindle(path);
          });
        } else {
          fs.readFile(path + '.backup', 'utf-8', function(err, data) {
            if (err) {
              return fs.writeFile(path + '.backup', data, 'utf-8');
            }
          });
          return parseClippings(data);
        }
      });
    } catch (_error) {}
  };

  $(window).on('app-ready', function() {
    window.fs = window.require("fs");
    window.path = '/Volumes/Kindle/documents/My\ Clippings.txt';
    return readKindle(path);
  });

  uploadFiles = function(files) {
    var reader;
    if (files[0].type === "text/plain" && files[0].name === "My Clippings.txt") {
      console.log("test passed!");
      reader = new FileReader();
      reader.addEventListener('loadend', function() {
        parseClippings(reader.result);
        return $('#listview').slideDown(500, false);
      });
      reader.readAsText(files[0]);
      return false;
    }
  };

  this.init = function() {
    return $(function() {
      var dataArray;
      $.event.props.push('dataTransfer');
      dataArray = [];
      $('#dropzone').bind('dragenter', function() {
        $('#dropzone').css('color', '#9C0001');
        $('#dropzone').css('border-color', '#282828');
        return false;
      });
      $('#dropzone').bind('drop', function(e) {
        var files;
        files = e.dataTransfer.files;
        return uploadFiles(files);
      });
      $('#dropview #try').click(function() {
        return $.get('My Clippings.txt', function(data) {
          parseClippings(data);
          return $('#listview').slideDown(500);
        });
      });
      $('#dropview #browse').click(function() {
        return document.getElementById("upfile").click();
      });
      $('#dropzone').bind('drop', function() {
        return false;
      });
      return $('#upfile').change(function(e) {
        return uploadFiles(e.target.files);
      });
    });
  };

}).call(this);
