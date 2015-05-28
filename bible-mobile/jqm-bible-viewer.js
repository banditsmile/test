/* 	Bible Viewer
	By : Mike More | http://www.moretechtips.net
	licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License. */

(function($) {
	// var chapterNodeName = 'CHAPTER', verseNodeName = 'VERS'; //Zefania XML 
	var chapterNodeName = 'chapter', verseNodeName = 'verse'; //OSIS XML 

	// Book list, short-name is the key
	// each book will contain its xml when requested 
	var books = {
	 _Gen: { bname: 'Genesis' },
	 _Exod: { bname: 'Exodus' },
	 _Lev: { bname: 'Leviticus' },
	 _Num: { bname: 'Numbers' },
	 _Deut: { bname: 'Deuteronomy' },
	 _Josh: { bname: 'Joshua' },
	 _Judg: { bname: 'Judges' },
	 _Ruth: { bname: 'Ruth' },
	 _1Sam: { bname: '1 Samuel' },
	 _2Sam: { bname: '2 Samuel' },
	 _1Kgs: { bname: '1 Kings' },
	 _2Kgs: { bname: '2 Kings' },
	 _1Chr: { bname: '1 Chronicles' },
	 _2Chr: { bname: '2 Chronicles' },
	 _Ezra: { bname: 'Ezra' },
	 _Neh: { bname: 'Nehemiah' },
	 _Esth: { bname: 'Esther' },
	 _Job: { bname: 'Job' },
	 _Ps: { bname: 'Psalm' },
	 _Prov: { bname: 'Proverbs' },
	 _Eccl: { bname: 'Ecclesiastes' },
	 _Song: { bname: 'Song of Solomon' },
	 _Isa: { bname: 'Isaiah' },
	 _Jer: { bname: 'Jeremiah' },
	 _Lam: { bname: 'Lamentations' },
	 _Ezek: { bname: 'Ezekiel' },
	 _Dan: { bname: 'Daniel' },
	 _Hos: { bname: 'Hosea' },
	 _Joel: { bname: 'Joel' },
	 _Amos: { bname: 'Amos' },
	 _Obad: { bname: 'Obadiah' },
	 _Jonah: { bname: 'Jonah' },
	 _Mic: { bname: 'Micah' },
	 _Nah: { bname: 'Nahum' },
	 _Hab: { bname: 'Habakkuk' },
	 _Zeph: { bname: 'Zephaniah' },
	 _Hag: { bname: 'Haggai' },
	 _Zech: { bname: 'Zechariah' },
	 _Mal: { bname: 'Malachi' },
	 _Matt: { bname: 'Matthew' },
	 _Mark: { bname: 'Mark' },
	 _Luke: { bname: 'Luke' },
	 _John: { bname: 'John' },
	 _Acts: { bname: 'Acts' },
	 _Rom: { bname: 'Romans' },
	 _1Cor: { bname: '1 Corinthians' },
	 _2Cor: { bname: '2 Corinthians' },
	 _Gal: { bname: 'Galatians' },
	 _Eph: { bname: 'Ephesians' },
	 _Phil: { bname: 'Philippians' },
	 _Col: { bname: 'Colossians' },
	 _1Thess: { bname: '1 Thessalonians' },
	 _2Thess: { bname: '2 Thessalonians' },
	 _1Tim: { bname: '1 Timothy' },
	 _2Tim: { bname: '2 Timothy' },
	 _Titus: { bname: 'Titus' },
	 _Phlm: { bname: 'Philemon' },
	 _Heb: { bname: 'Hebrews' },
	 _Jas: { bname: 'James' },
	 _1Pet: { bname: '1 Peter' },
	 _2Pet: { bname: '2 Peter' },
	 _1John: { bname: '1 John' },
	 _2John: { bname: '2 John' },
	 _3John: { bname: '3 John' },
	 _Jude: { bname: 'Jude' },
	 _Rev: { bname: 'Revelation' } };
	
	$(document).ready(function() {
		var book_list = $('#book_list');

		// create books as nested list view
		var iHtml = '<li>Old Testament <ul>';
		for(var x in books) {
			if( x=='_Matt') iHtml += '</ul></li> <li>New Testament <ul>';
			iHtml += '<li><a href="#chapter?book='+ x.substring(1) +'&num=1">'+ books[x].bname +'</a></li>';
		};
		iHtml += '</ul></li>';
		book_list.html( iHtml ).listview('refresh');

		// jump to chapter event
		$('#chapter_num').change(function(){
			var sel = $(this);
			$.mobile.changePage(sel.val())
		})
	});
	
	// Listen for pagebeforechange event
	$(document).bind( "pagebeforechange", function( e, data ) {
		// only handle changePage() when loading a page by URL.
		if ( typeof data.toPage === "string" ) {
			// Handle URLs that requests chapter page
			var url = $.mobile.path.parseUrl( data.toPage ), regex = /^#chapter/;
			if ( url.hash.search(regex) !== -1 ) {
				showChapter( url, data.options );
				// tell changePage() we've handled this 
				e.preventDefault()
			}
		}
	});
		
	// Show chapter
	function showChapter( url, options ) {
		// parse params in url hash
		var params = hashParams(url.hash);

		// Get book by its short-name
		var book = books[ '_' + params['book'] ];
		if( !book ) {
			alert('Book not found!');
			return
		};

		// book xml was not loaded ?
		if( book['xml']==undefined || !book['xml'] ){
			// call loadBook first
			loadBook( params['book'], url, options);
			return
		};

		// get chapter num
		var chapterNum = parseInt( params['num'] );
		if ( isNaN(chapterNum) || chapterNum<=0 ) chapterNum=1;

		// get chapters nodes in book
		var chapters = $( chapterNodeName , book['xml']);
		var chaptersSize = chapters.size();
		// Use last chapter if num is greater than chapters count
		if( chapterNum > chaptersSize ) chapterNum= chaptersSize;

		// get chapter
		var chapter = chapters.eq( chapterNum-1 );

		// append verses as paragraphs
		var chapterHTML = '';
		$( verseNodeName , chapter).each(function(i) {
			var vers = $(this);
			chapterHTML += '<p><sup>'+ (i+1) +'</sup> '+ vers.text() +'</p>'
		});

		// Get the empty page we are going to insert our content into.
		var $page = $('#chapter');
		
		// Get the header for the page to set it
		$header = $page.children( ":jqmData(role=header)" );
		$header.find( "h1" ).html( book.bname +' '+ chapterNum );

		// Get the content element for the page to set it
		$content = $page.children( ":jqmData(role=content)" );
		$content.html(chapterHTML);

		// change href of next links to the next chapter
		var nextChapterNum = chapterNum >= chaptersSize? chaptersSize : chapterNum+1;
		$('a.next', $page).attr('href' , '#chapter?book='+ params['book'] + '&num='+ nextChapterNum );

		// Create chapter numbers of the jump-to box
		var selectBox = $('#chapter_num');
		var selectHTML = '';
		for ( var i=1; i<= chaptersSize; i++) {
			selectHTML += '<option value="#chapter?book='+ params['book'] +'&num='+i+'"'+
						( i==chapterNum? ' selected="selected" ' : '' ) +
						'>'+i+'</option>';
		};
		selectBox.html(selectHTML); 

		// update data-url that shows up in the browser location
		options.dataUrl = url.href;
		// make sure it updates browser location!
		options.allowSamePageTransition = true;
		// no transition effect
		options.transition = 'none';

		// switch to the page we just modified.
		$.mobile.changePage( $page, options )
	};
		
	// load book xml by its short name
	function loadBook(bsname, url, options) {
		// show loading icon
		$.mobile.showPageLoadingMsg();

		// load book xml file and call showChapter again
		$.ajax({
			url:'books/'+bsname+'.xml'
			,datatype:'xml'
			,success:function(xml){
				$.mobile.hidePageLoadingMsg();
				// set xml property of the book item
				var book = books[ '_' + bsname ];
				book['xml'] = xml;

				// call showChapter 
				showChapter( url, options );
			}
			,error: function(jqXHR, textStatus, errorThrown) {
				$.mobile.hidePageLoadingMsg();
				alert('Error loading book, try again!');
			}
		})
	};
	
	// parse params in hash
	function hashParams(hash) {
		var ret = {};
	    var match;
	    var plus   = /\+/g;
	    var search = /([^\?&=]+)=([^&]*)/g;
	    var decode = function(s) { 
	    	return decodeURIComponent(s.replace(plus, " ")); 
	    };
	    while( match = search.exec(hash) ) ret[decode(match[1])] = decode(match[2]);
	    
	    return ret
	};
})(jQuery);	