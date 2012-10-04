#
#
#
#
#

@book = $$
  view:
    format: '<li><a href="#" data-bind="title"></a></li>'
  #controllers:
    #create:
      #console.log('create')


@quote = $$
  view:
    format: '''<tr>
                <td>
                  <div class="share">
                    <a href="#"><i class="icon-twitter"></i></a>
                    <a href="#"><i class="icon-pinterest"></i></a>
                    <a href="#"><i class="icon-facebook"></i></a>
                  </div>
                  <h2 data-bind="text"/>
                  <div class="info" style="display:none;">
                    <span data-bind="title"/>  &sect;  <span data-bind="location"/>
                  </div>
                </td>
               </tr>'''
  controller:
    #'create': ->
      #addBook @.model.get 'title'
    'hover h2': ->
      @.view.$('tr').css('border-left-style','solid')
      @.view.$('.info').slideDown()
    'mouseout h2; mouseout div;': ->
      @.view.$('tr').css('border-left-style','none')
      @.view.$('.info').slideUp()

@quotes = []
@books = {}

dropFile = ->
  console.log this

parseClippings = (data) ->
  # Borrowed jplattel's python script for parsing the text file
  # original url: https://gist.github.com/1071682

  window.clippings = data.split('==========')
  notes = []
  for clip in clippings
    if clip.indexOf("Added on ") != -1
      clipping = clip.split('Added on ')
      note = {}
      note.title = clipping[0].split('\r\n- ')[0].replace('\r\n','').replace(/\([\w\s.]+\)$/,'')
      books[note.title] = $$ book, {'title':note.title}
      note.author = clipping[0].split('\r\n- ')[0].replace('\r\n','').match(/\([\w\s]+\)$/)
      #date = time.strptime(clipping[1].split('\r\n')[0], "%A, %B %d, %Y, %I:%M %p")
      #date = time.strftime('%Y-%m-%dT%H:%M:%S',date)
      note.location = clipping[0].split('\r\n-')[1].replace('\r\n','').replace('|','').replace('   ','').replace(' |','')
      note.text = clipping[1].split('\r\n\r\n')[1].replace('\r\n','')
      notes.push(note)
  showBooks()
  displayClippings notes

showBooks = ->
  for i in Object.keys(books)
    $$.document.append(books[i], '#booklist')

displayClippings = (clippings) ->
  #console.log data
  $('#dropview').slideUp(500)
  $('#listview').slideDown(500)

  for clip, key in clippings
    quotes[key] = $$(quote, clip)
    $$.document.append quotes[key], '#listview table'

  $(window.frame).animate(
      height: 600
      width:  900
      ,1000)

$(window).on 'app-ready', ->
  window.fs = window.require "fs"
  osxpath = '/Users/jelle/My\ Clippings.txt'
  #osxpath = '/Volumes/Kindle/documents/My\ Clippings.txt'
  fs.readFile osxpath, 'utf-8', (err, data) ->
    #Backup in case I might destroy something
    fs.readFile osxpath+'.backup', 'utf-8', (err, data) ->
      if (err)
        fs.writeFile osxpath+'.backup', data, 'utf-8'
    parseClippings data
