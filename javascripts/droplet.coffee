@book = $$
  view:
    format: '<li><a href="#" data-bind="title"></a></li>'
  controller:
    'click a': ->
      title = @.model.get 'title'
      $('.dropdown-toggle').text title
      selectBooks title

@quote = $$
  view: # Need to fix inline svg's!
    format: '''<tr>
                <td>
                  <div class="share">
                    <div class="buttons">
                      <a href="#" id="twitter" class="sharebutton">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve"><path id="twitter-5-icon" d="M256,90c91.742,0,166,74.244,166,166c0,91.741-74.245,166-166,166c-91.743,0-166-74.245-166-166 C90,164.259,164.244,90,256,90 M256,50C142.229,50,50,142.229,50,256s92.229,206,206,206s206-92.229,206-206S369.771,50,256,50 L256,50z M368.797,201.997c-7.712,3.42-15.999,5.732-24.697,6.771c8.876-5.322,15.696-13.748,18.906-23.79 c-8.311,4.928-17.512,8.506-27.307,10.435c-7.843-8.357-19.02-13.579-31.387-13.579c-27.756,0-48.16,25.902-41.889,52.8 c-35.736-1.793-67.423-18.913-88.63-44.928c-11.265,19.323-5.844,44.61,13.308,57.409c-7.049-0.223-13.682-2.158-19.478-5.379 c-0.466,19.922,13.811,38.552,34.489,42.708c-6.052,1.646-12.681,2.023-19.419,0.735c5.472,17.084,21.354,29.516,40.17,29.862 c-18.079,14.169-40.849,20.495-63.661,17.807c19.028,12.2,41.632,19.32,65.915,19.32c79.834,0,124.939-67.433,122.222-127.911 C355.741,218.194,363.031,210.62,368.797,201.997z"/></svg>
                      </a>
                      <a href="#" id="tumblr" class="sharebutton">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve"><path id="tumblr-circle-outline-icon" d="M256.417,90c44.34,0,86.026,17.267,117.38,48.62c31.354,31.354,48.62,73.04,48.62,117.38 c0,44.34-17.267,86.026-48.62,117.38c-31.354,31.353-73.04,48.62-117.38,48.62s-86.026-17.268-117.38-48.62 c-31.354-31.354-48.62-73.04-48.62-117.38c0-44.34,17.267-86.026,48.62-117.38C170.391,107.267,212.077,90,256.417,90 M256.417,50 c-113.771,0-206,92.229-206,206s92.229,206,206,206s206-92.229,206-206S370.188,50,256.417,50L256.417,50z M235.171,147.038 c-1.414,11.436-3.995,20.847-7.742,28.249c-3.745,7.406-8.714,13.742-14.91,19.023c-6.193,5.278-13.63,9.335-22.318,12.163v31.618 h24.303v77.772c0,10.135,1.059,17.866,3.187,23.2c2.121,5.337,5.938,10.376,11.441,15.115c5.497,4.739,12.145,8.386,19.941,10.946 c7.79,2.556,16.752,3.837,26.89,3.837c8.931,0,17.241-0.896,24.925-2.687c7.68-1.796,16.265-4.918,25.746-9.381v-34.899 c-11.119,7.306-22.296,10.96-33.525,10.96c-6.322,0-11.939-1.47-16.844-4.42c-3.705-2.174-6.242-5.093-7.605-8.746 c-1.364-3.652-2.042-11.914-2.042-24.778v-56.92h52.698v-34.839h-52.698v-56.214H235.171z"/></svg>
                      </a>
                      <a href="#" id="facebook" class="sharebutton">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="72px" height="72px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">                      <path id="facebook-circle-outline-icon" d="M256.417,90c44.34,0,86.026,17.267,117.38,48.62c31.354,31.354,48.62,73.04,48.62,117.38                        c0,44.34-17.267,86.026-48.62,117.38c-31.354,31.353-73.04,48.62-117.38,48.62s-86.026-17.268-117.38-48.62                        c-31.354-31.354-48.62-73.04-48.62-117.38c0-44.34,17.267-86.026,48.62-117.38C170.391,107.267,212.077,90,256.417,90 M256.417,50                        c-113.771,0-206,92.229-206,206s92.229,206,206,206s206-92.229,206-206S370.188,50,256.417,50L256.417,50z M228.111,218.133h-23.517                        v38.386h23.517v112.764h45.22V256.04h31.551l3.358-37.907h-34.909c0,0,0-14.155,0-21.593c0-8.938,1.801-12.477,10.438-12.477                        c6.957,0,24.471,0,24.471,0v-39.347c0,0-25.797,0-31.309,0c-33.649,0-48.82,14.814-48.82,43.186                        C228.111,212.614,228.111,218.133,228.111,218.133z"/></svg>
                      </a>
                    </div>
                  </div>
                  <div class="quote">
                    <h2 data-bind="text"/>
                    <div class="info" style="display:none;">
                      <strong data-bind="author"/> in <strong data-bind="title"/>  &sect;  <span data-bind="location"/>
                    </div>
                  </div>
                </td>
               </tr>'''
  controller:
    'hover h2': ->
      @.view.$('.info').stop().slideDown()

    'mouseout h2': ->
      @.view.$('.info').stop().slideUp()

    'click .sharebutton': (event) ->
      console.log event
      media = event.target.parentElement.id
      console.log(media)
      shareQuote media, @.model

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
  title = message.get 'title'
  author = message.get 'author'
  text = message.get 'text'
  # add quotes to text
  sm = 
    facebook: """
              https://www.facebook.com/dialog/feed?
              app_id=152073644937064&
              picture=http://f.cl.ly/items/0A1R3h3P1Y1v3j3Z2P3E/quotes.png&
              name=#{ text }&
              caption=#{ author }%20in%20#{ title}
              redirect_uri=http://jellea.github.com/klartext/posted.html"""
    twitter:  "http://twitter.com/share?text=#{ text }%20-%20#{ author }%20in%20#{ title}"
    tumblr:   """http://www.tumblr.com/share/quote
              ?source=#{ author }%20in%20#{ title}
              &quote=#{ text }"""

  window.open(sm[media])

parseClippings = (data) ->
  # Borrowed jplattel's python script for parsing the text file
  # original url: https://gist.github.com/1071682

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
      note.text = clipping[1].split('\r\n\r\n')[1].replace('\r\n','')
      window.notes.push(note)
  showBooks()
  displayClippings window.notes

  $('#dropview').slideUp 500, ->
    $(window.frame).animate
      height: 600
      width:  900
      ,350
      , ->
        $('#listview').slideDown 500

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

$(window).on 'app-ready', ->
  window.fs = window.require "fs"
  #osxpath = '/Users/jelle/My\ Clippings.txt'
  osxpath = '/Volumes/Kindle/documents/My\ Clippings.txt'
  fs.readFile osxpath, 'utf-8', (err, data) ->
    if (err)
      console.log err
    else
      #Backup in case I might destroy something
      fs.readFile osxpath+'.backup', 'utf-8', (err, data) ->
        if (err)
          fs.writeFile osxpath+'.backup', data, 'utf-8'
      parseClippings data

$(document).ready ->
  $.event.props.push 'dataTransfer'
  dataArray = []

  $('#dropzone').bind 'dragenter', ->
    $('#dropzone').css 'color', '#9C0001'
    return false

  $('#dropzone').bind 'drop', (e) ->
    files = e.dataTransfer.files
    console.log files
    if files[0].type == "text/plain" and files[0].name == "My Clippings.txt"
      console.log "test passed!"
      reader = new FileReader()
      reader.addEventListener 'loadend', ->
        parseClippings reader.result
        $('#listview').slideDown 500
        , false
      reader.readAsText files[0]
    return false
  
  $('#dropview a').click ->
    $.get 'My Clippings.txt', (data) ->
      parseClippings data
      $('#listview').slideDown 500


  $('#dropzone').bind 'drop', ->
    return false
