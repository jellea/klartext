@book = $$
  view:
    format: '<li><a href="#" data-bind="title"></a></li>'
  controller:
    'click a': ->
      title = @.model.get 'title'
      $('.dropdown-toggle').html "#{title} <b class=\"caret\"></b>"
      selectBooks title

@quote = $$
  view: # Need to fix inline svg's!
    format: """<tr>
                <td>
                  <div class="share">
                    <div class="overlay"></div>
                    <div class="buttons">
                      <a id="twitter" class="sharebutton">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve"><path id="twitter-5-icon" d="M256,90c91.742,0,166,74.244,166,166c0,91.741-74.245,166-166,166c-91.743,0-166-74.245-166-166 C90,164.259,164.244,90,256,90 M256,50C142.229,50,50,142.229,50,256s92.229,206,206,206s206-92.229,206-206S369.771,50,256,50 L256,50z M368.797,201.997c-7.712,3.42-15.999,5.732-24.697,6.771c8.876-5.322,15.696-13.748,18.906-23.79 c-8.311,4.928-17.512,8.506-27.307,10.435c-7.843-8.357-19.02-13.579-31.387-13.579c-27.756,0-48.16,25.902-41.889,52.8 c-35.736-1.793-67.423-18.913-88.63-44.928c-11.265,19.323-5.844,44.61,13.308,57.409c-7.049-0.223-13.682-2.158-19.478-5.379 c-0.466,19.922,13.811,38.552,34.489,42.708c-6.052,1.646-12.681,2.023-19.419,0.735c5.472,17.084,21.354,29.516,40.17,29.862 c-18.079,14.169-40.849,20.495-63.661,17.807c19.028,12.2,41.632,19.32,65.915,19.32c79.834,0,124.939-67.433,122.222-127.911 C355.741,218.194,363.031,210.62,368.797,201.997z"/></svg>
                      </a>
                      <a id="facebook" class="sharebutton">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">                      <path id="facebook-circle-outline-icon" d="M256.417,90c44.34,0,86.026,17.267,117.38,48.62c31.354,31.354,48.62,73.04,48.62,117.38                        c0,44.34-17.267,86.026-48.62,117.38c-31.354,31.353-73.04,48.62-117.38,48.62s-86.026-17.268-117.38-48.62                        c-31.354-31.354-48.62-73.04-48.62-117.38c0-44.34,17.267-86.026,48.62-117.38C170.391,107.267,212.077,90,256.417,90 M256.417,50                        c-113.771,0-206,92.229-206,206s92.229,206,206,206s206-92.229,206-206S370.188,50,256.417,50L256.417,50z M228.111,218.133h-23.517                        v38.386h23.517v112.764h45.22V256.04h31.551l3.358-37.907h-34.909c0,0,0-14.155,0-21.593c0-8.938,1.801-12.477,10.438-12.477                        c6.957,0,24.471,0,24.471,0v-39.347c0,0-25.797,0-31.309,0c-33.649,0-48.82,14.814-48.82,43.186                        C228.111,212.614,228.111,218.133,228.111,218.133z"/></svg>
                      </a>
                      <a id="tumblr" class="sharebutton">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve"><path id="tumblr-circle-outline-icon" d="M256.417,90c44.34,0,86.026,17.267,117.38,48.62c31.354,31.354,48.62,73.04,48.62,117.38 c0,44.34-17.267,86.026-48.62,117.38c-31.354,31.353-73.04,48.62-117.38,48.62s-86.026-17.268-117.38-48.62 c-31.354-31.354-48.62-73.04-48.62-117.38c0-44.34,17.267-86.026,48.62-117.38C170.391,107.267,212.077,90,256.417,90 M256.417,50 c-113.771,0-206,92.229-206,206s92.229,206,206,206s206-92.229,206-206S370.188,50,256.417,50L256.417,50z M235.171,147.038 c-1.414,11.436-3.995,20.847-7.742,28.249c-3.745,7.406-8.714,13.742-14.91,19.023c-6.193,5.278-13.63,9.335-22.318,12.163v31.618 h24.303v77.772c0,10.135,1.059,17.866,3.187,23.2c2.121,5.337,5.938,10.376,11.441,15.115c5.497,4.739,12.145,8.386,19.941,10.946 c7.79,2.556,16.752,3.837,26.89,3.837c8.931,0,17.241-0.896,24.925-2.687c7.68-1.796,16.265-4.918,25.746-9.381v-34.899 c-11.119,7.306-22.296,10.96-33.525,10.96c-6.322,0-11.939-1.47-16.844-4.42c-3.705-2.174-6.242-5.093-7.605-8.746 c-1.364-3.652-2.042-11.914-2.042-24.778v-56.92h52.698v-34.839h-52.698v-56.214H235.171z"/></svg>
                      </a>
                      <a id="evernote" class="sharebutton">
                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 720 720" enable-background="new 0 0 2592 720" xml:space="preserve"><path id="evernote-circle-outline-icon" d="M171.582,182.353c0,0,0,0,0.036,0h54.447c3.12,0,5.629-2.541,5.635-5.637c0-0.02-0.661-46.685-0.661-59.662	V116.9c0-10.658,2.237-19.95,6.133-27.737l1.862-3.497c-0.208,0.035-0.417,0.137-0.624,0.345L132.618,190.919	c-0.207,0.17-0.336,0.391-0.396,0.618c2.188-1.083,5.18-2.563,5.603-2.749C147.038,184.631,158.209,182.353,171.582,182.353z M595.25,170.93c-4.325-23.152-18.09-34.562-30.535-39.048c-13.427-4.853-40.653-9.88-74.861-13.912
	c-27.521-3.241-59.868-2.983-79.407-2.379c-2.345-16.062-13.611-30.736-26.217-35.816c-33.587-13.519-85.48-10.253-98.804-6.519
	c-10.587,2.959-22.306,9.023-28.828,18.368c-4.374,6.242-7.204,14.239-7.226,25.411c0,6.323,0.176,21.218,0.337,34.452
	c0.16,13.275,0.334,25.148,0.334,25.229c-0.006,11.819-9.585,21.438-21.456,21.453h-54.456c-11.616,0-20.491,1.952-27.271,5.032
	c-6.79,3.083-11.599,7.239-15.253,12.156c-7.273,9.764-8.536,21.813-8.506,34.109c0,0,0.107,10.048,2.528,29.496
	c2.013,15.048,18.332,120.17,33.832,152.141c6.01,12.439,10.013,17.62,21.82,23.103c26.307,11.263,86.396,23.793,114.559,27.381
	c28.112,3.597,45.756,11.158,56.271-10.889c0.035-0.055,2.106-5.485,4.955-13.451c9.129-27.663,10.399-52.208,10.399-69.97
	c0-1.806,2.65-1.889,2.65,0c0,12.54-2.395,56.915,31.126,68.82c13.233,4.693,40.685,8.877,68.578,12.146
	c25.221,2.898,43.524,12.823,43.524,77.529c0,39.367-8.269,44.765-51.495,44.765c-35.04,0-48.395,0.907-48.395-26.931
	c0-22.499,22.252-20.141,38.744-20.141c7.366,0,2.02-5.479,2.02-19.36c0-13.808,8.636-21.79,0.468-21.992
	c-57.028-1.569-90.583-0.065-90.583,71.256c0,64.747,24.778,76.77,105.716,76.77c63.46,0,85.83-2.078,112.033-83.381
	c5.187-16.05,17.726-65.031,25.315-147.271C611.965,367.488,602.644,210.542,595.25,170.93z M484.627,344.405
	c-7.84-0.274-15.381,0.221-22.413,1.351c1.979-15.983,8.576-35.595,31.946-34.774c25.87,0.89,29.495,25.341,29.587,41.903
	C512.839,348.021,499.335,344.922,484.627,344.405z"/>
</svg>
                      </a>
                      <a id="link" class="sharebutton">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve"><path id="link-icon" d="M156.226,199.679c7.541-7.54,15.902-13.757,24.794-18.659c49.556-27.318,113.117-12.788,144.97,35.518 l-38.547,38.547c-11.059-25.227-38.5-39.565-65.813-33.456c-10.282,2.3-20.054,7.427-28.039,15.413l-73.898,73.896 c-22.433,22.433-22.432,58.936,0.002,81.369c22.433,22.433,58.935,22.433,81.368,0l22.78-22.779 c20.71,8.217,42.938,11.508,64.862,9.863l-50.278,50.278c-43.105,43.105-112.991,43.105-156.096,0 c-43.105-43.104-43.106-112.991-0.001-156.096L156.226,199.679z M273.574,82.33l-50.278,50.278 c21.928-1.643,44.152,1.648,64.863,9.865l22.779-22.78c22.434-22.434,58.936-22.434,81.37,0c22.434,22.434,22.434,58.936,0,81.37 l-73.897,73.895c-22.501,22.501-59.061,22.311-81.368,0c-5.202-5.201-9.694-11.678-12.484-18.04l-38.546,38.546 c4.049,6.142,8.261,11.453,13.666,16.858c13.949,13.95,31.698,24.339,52.117,29.251c26.466,6.37,54.823,2.839,79.185-10.592 c8.892-4.903,17.254-11.119,24.794-18.659l73.896-73.895c43.105-43.105,43.105-112.991,0.001-156.097 C386.566,39.225,316.68,39.225,273.574,82.33z"/></svg>
                      </a>
                    </div>
                  </div>
                  <div class="quote" id="#{ Math.random()+Math.random()*Math.random() }">
                    <h2 data-bind="text"/>
                    <div class="info" style="display:none;">
                      <strong data-bind="author"/> in <strong data-bind="title"/>  &sect;  <span data-bind="location"/>
                    </div>
                  </div>
                </td>
               </tr>"""
  controller:
    'hover h2': ->
      @.view.$('.info').stop().slideDown()

    'mouseout h2': ->
      @.view.$('.info').stop().slideUp()

    'click .sharebutton': (event) ->
      console.log event
      if event.target.childElementCount == 0
        media = event.target.parentElement.parentElement.id
      else
        media = event.target.parentElement.id
      console.log(media)
      shareQuote media, @

    'click h2': ->
      $('.share:visible').fadeOut(200)
      @.view.$('.share').show()
      @.view.$('.share').css 'width','0%'
      @.view.$('.share').animate
                            'width':'100%'
                        ,350

    'click .share': ->
      @.view.$('.share').fadeOut(200)


@quotes = []
@books = {}

dropFile = ->
  console.log this

shareQuote = (media, message) ->
  title = message.model.get 'title'
  author = message.model.get 'author'
  text = "\""+message.model.get('text')+"\""

  $.ajax
    type: 'POST'
    url: 'https://www.googleapis.com/urlshortener/v1/url'
    data: "{'longUrl':'http://jellea.github.com/klartext/showquote.html?text=#{escape(text)}&author=#{escape(author)}&title=#{escape(title)}'}"
    contentType: 'application/json'
    processData: false
    success: (shorturl) ->
      sm =
        link:     shorturl.id
        facebook: """
                  https://www.facebook.com/dialog/feed?
                  app_id=152073644937064&
                  link=#{ shorturl.id }&
                  picture=http://f.cl.ly/items/0A1R3h3P1Y1v3j3Z2P3E/quotes.png&
                  name=#{ text }&
                  caption=#{ author }%20in%20#{ title}&
                  redirect_uri=http://jellea.github.com/klartext/posted.html"""
        twitter:  "http://twitter.com/share?text=#{ text }%20-%20#{ author }%20in%20#{ title }&url="
        tumblr:   """
                  http://www.tumblr.com/share/quote
                  ?source=#{ author }%20in%20#{ title}
                  &quote=#{ text }
                  """
      if media == 'twitter' and "#{ text } -#{ author } in #{ title }".length > 140
        # tweet limit - short url length - (3space+3dots+dash+quotes=9) = maxlength of quote
        maxlengthquote = 140-shorturl.id.length-9
        text = "\"#{ text.substr(0,maxlengthquote) }...\" -"
        sm.twitter = "http://twitter.com/share?text=#{ text }&url=#{ shorturl.id }"

      if media == 'evernote'
        console.log message.view.$('.quote').attr 'id'
        message.view.$('.info').slideDown()
        Evernote.doClip
          suggestNotebook:'quotes'
          providerName:'Klartext'
          title: "Klartext Quote: #{ text.substr 0, 50 }"
          url: shorturl.id
          contentId: message.view.$('.quote').attr 'id'
          suggestTags:'kindle, quote, klartext'

      else if (exec?)
        exec "open #{sm[media]}", (error, stdout, stderr) ->
          if error != null
            console.log "exec error: #{error}"
      else
        window.open(sm[media])

parseClippings = (data) ->
  try
    fs.unwatchFile window.path
  # Borrowed jplattel's python script for parsing the text file
  # original url: https://gist.github.com/1071682

  $('#dropview').slideUp 500, ->
    $(window.frame).animate
      height: 600
      width:  900
      ,350
      , ->
        $('#listview').slideDown 500

  clippings = data.split('==========')
  window.notes = []
  for clip in clippings
    if clip.indexOf("Added on ") != -1
      #todo: date en note recognition
      clipping = clip.split('Added on ')
      note = {}
      note.title = clipping[0].split('\r\n- ')[0].replace('\r\n','').replace(/\([\w\s.]+\)$/,'')
      books[note.title] = $$ book, {'title':note.title}
      note.author = clipping[0].split('\r\n- ')[0].replace('\r\n','').match(/\([\w\s.]+\)$/)[0].replace(/[\(\)]/g,'')
      #date = time.strptime(clipping[1].split('\r\n')[0], "%A, %B %d, %Y, %I:%M %p")
      #date = time.strftime('%Y-%m-%dT%H:%M:%S',date)
      note.location = clipping[0].split('\r\n-')[1].replace('\r\n','').replace('|','').replace('   ','').replace(' |','')
      note.text = clipping[1].split('\r\n\r\n')[1].replace('\r\n','').replace(/^"/,'').replace(/"$/,'')
      window.notes.push(note)
  showBooks()
  displayClippings window.notes

showBooks = ->
  for i in Object.keys books
    $$.document.append books[i], '#booklist'

selectBooks = (title) ->
  newarray = []
  for q in window.notes
    if q.title == title
      newarray.push(q)
  displayClippings newarray

displayClippings = (clippings) ->
  for q in quotes
    q.destroy()

  for clip, key in clippings.reverse()
    quotes[key] = $$(quote, clip)
    $$.document.append quotes[key], '#listview table'
    if key > 100
      break

$('#seeall').click ->
  displayClippings window.notes

readKindle = (path) ->
  try
    fs.readFile path, 'utf-8', (err, data) ->
        if (err)
          console.log err
          fs.watchFile path, (curr, prev) ->
            readKindle path
        else
          #Backup in case I might destroy something
          fs.readFile path+'.backup', 'utf-8', (err, data) ->
            if (err)
              fs.writeFile path+'.backup', data, 'utf-8'
          parseClippings data


$(window).on 'app-ready', ->
  window.fs = window.require "fs"
  #osxpath = '/Users/jelle/My\ Clippings.txt'
  window.path = '/Volumes/Kindle/documents/My\ Clippings.txt'
  readKindle(path)

uploadFiles = (files) ->
  if files[0].type == "text/plain" and files[0].name == "My Clippings.txt"
    console.log "test passed!"
    reader = new FileReader()
    reader.addEventListener 'loadend', ->
      parseClippings reader.result
      $('#listview').slideDown 500
      , false
    reader.readAsText files[0]
    return false

@init = ->
  $ ->
      $.event.props.push 'dataTransfer'
      dataArray = []

      $('#dropzone').bind 'dragenter', ->
        $('#dropzone').css 'color', '#9C0001'
        $('#dropzone').css 'border-color', '#282828'
        return false

      $('#dropzone').bind 'drop', (e) ->
        files = e.dataTransfer.files
        uploadFiles files

      $('#dropview #try').click ->
        $.get 'My Clippings.txt', (data) ->
          parseClippings data
          $('#listview').slideDown 500

      $('#dropview #browse').click ->
        document.getElementById("upfile").click()

      $('#dropzone').bind 'drop', ->
        return false

      $('#upfile').change (e)->
        uploadFiles e.target.files
