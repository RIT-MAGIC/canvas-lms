#
# *    jQuery carouFredSel 6.2.1
# *	Demo's and documentation:
# *	caroufredsel.dev7studios.com
# *
# *	Copyright (c) 2013 Fred Heusschen
# *	www.frebsite.nl
# *
# *	Dual licensed under the MIT and GPL licenses.
# *	http://en.wikipedia.org/wiki/MIT_License
# *	http://en.wikipedia.org/wiki/GNU_General_Public_License
# 
(($) ->
  
  #	LOCAL
  
  #	no element
  
  #	multiple elements
  
  #	complement items and sizes
  
  #	primary size not set for a responsive carousel
  
  #	primary size is percentage
  
  #	visible-items not set
  
  #	primary size not set -> calculate it or set to "variable"
  
  #	align not set -> set to center if primary size is number
  
  #	set variabe visible-items
  
  #	set visible items by filter
  
  #	align: center, left or right
  
  #	padding
  
  #	swipe and mousewheel extend later on, per direction
  
  #	DEPRECATED
  
  #	/DEPRECATED
  #	/init
  #	/build
  
  #	stop event
  
  #	button
  
  #	set stopped
  
  #	finish event
  
  #	pause event
  
  #	immediately pause
  
  #	update remaining pause-time
  
  #	button
  
  #	set paused
  
  #	pause pause callback
  
  #	play event
  
  #	sort params
  
  #	stopped?
  
  #	button
  
  #	set playing
  
  #	timeout the scrolling
  
  #	pause start callback
  
  #	resume event
  
  #	prev + next events
  
  #	stopped or hidden carousel, don't scroll, don't queue
  
  #	not enough items
  
  #	get config
  
  #	test conditions callback
  
  #	resume animation, add current to queue
  
  #	queue if scrolling
  
  #	synchronise
  
  #	prev event
  
  #	non-circular at start, scroll to end
  
  #	find number of items to scroll
  
  #	prevent non-circular from scrolling to far
  
  #	set new number of visible items
  
  #	scroll 0, don't scroll
  
  #	save new config
  
  #	non-circular callback
  
  #	rearrange items
  
  #	the needed items
  
  #	hide items for fx directscroll
  
  #	save new sizes
  
  #	scrolling functions
  
  #	clone carousel
  
  #	reset all scrolls
  
  #	animate / set carousel
  
  #	animate / set wrapper
  
  #	animate / set items
  
  #	set position
  
  #	rearrange items
  
  #	fire onAfter callbacks
  
  #	fire onBefore callback
  
  #	next event
  
  #	non-circular at end, scroll to start
  
  #	find number of items to scroll
  
  #	prevent non-circular from scrolling to far
  
  #	set new number of visible items
  
  #	scroll 0, don't scroll
  
  #	save new config
  
  #	non-circular callback
  
  #	rearrange items
  
  #	the needed items
  
  #	hide items for fx directscroll
  
  #	save new sizes
  
  #	scrolling functions
  
  #	clone carousel
  
  #	reset all scrolls
  
  #	animate / set carousel
  
  #	animate / set wrapper
  
  #	animate / set items
  
  #	set position
  
  #	rearrange items
  
  #	fire onAfter callbacks
  
  #	fire onBefore callbacks
  
  #	slideTo event
  
  #	prevPage event
  
  #	nextPage event
  
  #	slideToPage event
  
  #	jumpToStart event
  
  #	synchronise event
  
  #	queue event
  
  #	insertItem event
  
  #	removeItem event
  
  #	onBefore and onAfter event
  
  #	currentPosition event
  
  #	currentPage event
  
  #	currentVisible event
  
  #	slice event
  
  #	isPaused, isStopped and isScrolling events
  
  #	configuration event
  
  #	return entire configuration-object
  
  #	set multiple options via object
  
  #	callback function for specific option
  
  #	set individual option
  
  #	return value for specific option
  
  #	linkAnchors event
  
  #	updatePageStatus event
  
  #	updateSizes event
  
  #	destroy event
  
  #	debug event
  
  #	triggerEvent, making prefixed and namespaced events accessible from outside
  #	/bind_events
  #	/unbind_events
  
  #	play button
  
  #	prev button
  
  #	next butotn
  
  #	pagination
  
  #	prev/next keys
  
  #	pagination keys
  
  #	swipe
  
  #	mousewheel
  #	/bind_buttons
  #	/unbind_buttons
  
  #	START
  
  #	set vars
  
  #	create carousel
  
  #	find item to start
  
  #	GLOBAL PUBLIC
  
  #	GLOBAL PRIVATE
  
  #	scrolling functions
  sc_setScroll = (d, e, c) ->
    e = "ease"  if e is "swing"  if c.transition is "transition"
    anims: []
    duration: d
    orgDuration: d
    easing: e
    startTime: getTime()
  sc_startScroll = (s, c) ->
    a = 0
    l = s.anims.length

    while a < l
      b = s.anims[a]
      continue  unless b
      b[0][c.transition] b[1], s.duration, s.easing, b[2]
      a++
  sc_stopScroll = (s, finish) ->
    finish = true  unless is_boolean(finish)
    sc_stopScroll s.pre, finish  if is_object(s.pre)
    a = 0
    l = s.anims.length

    while a < l
      b = s.anims[a]
      b[0].stop true
      if finish
        b[0].css b[1]
        b[2]()  if is_function(b[2])
      a++
    sc_stopScroll s.post, finish  if is_object(s.post)
  sc_afterScroll = ($c, $c2, o) ->
    $c2.remove()  if $c2
    switch o.fx
      when "fade", "crossfade"
    , "cover-fade"
    , "uncover-fade"
        $c.css "opacity", 1
        $c.css "filter", ""
  sc_fireCallbacks = ($t, o, b, a, c) ->
    o[b].call $t, a  if o[b]
    if c[b].length
      i = 0
      l = c[b].length

      while i < l
        c[b][i].call $t, a
        i++
    []
  sc_fireQueue = ($c, q, c) ->
    if q.length
      $c.trigger cf_e(q[0][0], c), q[0][1]
      q.shift()
    q
  sc_hideHiddenItems = (hiddenitems) ->
    hiddenitems.each ->
      hi = $(this)
      hi.data("_cfs_isHidden", hi.is(":hidden")).hide()

  sc_showHiddenItems = (hiddenitems) ->
    if hiddenitems
      hiddenitems.each ->
        hi = $(this)
        hi.show()  unless hi.data("_cfs_isHidden")

  sc_clearTimers = (t) ->
    clearTimeout t.auto  if t.auto
    clearInterval t.progress  if t.progress
    t
  sc_mapCallbackArguments = (i_old, i_skp, i_new, s_itm, s_dir, s_dur, w_siz) ->
    width: w_siz.width
    height: w_siz.height
    items:
      old: i_old
      skipped: i_skp
      visible: i_new

    scroll:
      items: s_itm
      direction: s_dir
      duration: s_dur
  sc_getDuration = (sO, o, nI, siz) ->
    dur = sO.duration
    return 0  if sO.fx is "none"
    if dur is "auto"
      dur = o.scroll.duration / o.scroll.items * nI
    else dur = siz / dur  if dur < 10
    return 0  if dur < 1
    dur = dur / 2  if sO.fx is "fade"
    Math.round dur
  
  #	navigation functions
  nv_showNavi = (o, t, c) ->
    minimum = (if (is_number(o.items.minimum)) then o.items.minimum else o.items.visible + 1)
    if t is "show" or t is "hide"
      f = t
    else if minimum > t
      debug c, "Not enough items (" + t + " total, " + minimum + " needed): Hiding navigation."
      f = "hide"
    else
      f = "show"
    s = (if (f is "show") then "removeClass" else "addClass")
    h = cf_c("hidden", c)
    o.auto.button[f]()[s] h  if o.auto.button
    o.prev.button[f]()[s] h  if o.prev.button
    o.next.button[f]()[s] h  if o.next.button
    o.pagination.container[f]()[s] h  if o.pagination.container
  nv_enableNavi = (o, f, c) ->
    return  if o.circular or o.infinite
    fx = (if (f is "removeClass" or f is "addClass") then f else false)
    di = cf_c("disabled", c)
    o.auto.button[fx] di  if o.auto.button and fx
    if o.prev.button
      fn = (if fx or (f is 0) then "addClass" else "removeClass")
      o.prev.button[fn] di
    if o.next.button
      fn = (if fx or (f is o.items.visible) then "addClass" else "removeClass")
      o.next.button[fn] di
  
  #	get object functions
  go_getObject = ($tt, obj) ->
    if is_function(obj)
      obj = obj.call($tt)
    else obj = {}  if is_undefined(obj)
    obj
  go_getItemsObject = ($tt, obj) ->
    obj = go_getObject($tt, obj)
    if is_number(obj)
      obj = visible: obj
    else if obj is "variable"
      obj =
        visible: obj
        width: obj
        height: obj
    else obj = {}  unless is_object(obj)
    obj
  go_getScrollObject = ($tt, obj) ->
    obj = go_getObject($tt, obj)
    if is_number(obj)
      if obj <= 50
        obj = items: obj
      else
        obj = duration: obj
    else if is_string(obj)
      obj = easing: obj
    else obj = {}  unless is_object(obj)
    obj
  go_getNaviObject = ($tt, obj) ->
    obj = go_getObject($tt, obj)
    if is_string(obj)
      temp = cf_getKeyCode(obj)
      if temp is -1
        obj = $(obj)
      else
        obj = temp
    obj
  go_getAutoObject = ($tt, obj) ->
    obj = go_getNaviObject($tt, obj)
    if is_jquery(obj)
      obj = button: obj
    else if is_boolean(obj)
      obj = play: obj
    else obj = timeoutDuration: obj  if is_number(obj)
    obj.progress = bar: obj.progress  if is_string(obj.progress) or is_jquery(obj.progress)  if obj.progress
    obj
  go_complementAutoObject = ($tt, obj) ->
    obj.button = obj.button.call($tt)  if is_function(obj.button)
    obj.button = $(obj.button)  if is_string(obj.button)
    obj.play = true  unless is_boolean(obj.play)
    obj.delay = 0  unless is_number(obj.delay)
    obj.pauseOnEvent = true  if is_undefined(obj.pauseOnEvent)
    obj.pauseOnResize = true  unless is_boolean(obj.pauseOnResize)
    obj.timeoutDuration = (if (obj.duration < 10) then 2500 else obj.duration * 5)  unless is_number(obj.timeoutDuration)
    if obj.progress
      obj.progress.bar = obj.progress.bar.call($tt)  if is_function(obj.progress.bar)
      obj.progress.bar = $(obj.progress.bar)  if is_string(obj.progress.bar)
      if obj.progress.bar
        obj.progress.updater = $.fn.carouFredSel.progressbarUpdater  unless is_function(obj.progress.updater)
        obj.progress.interval = 50  unless is_number(obj.progress.interval)
      else
        obj.progress = false
    obj
  go_getPrevNextObject = ($tt, obj) ->
    obj = go_getNaviObject($tt, obj)
    if is_jquery(obj)
      obj = button: obj
    else obj = key: obj  if is_number(obj)
    obj
  go_complementPrevNextObject = ($tt, obj) ->
    obj.button = obj.button.call($tt)  if is_function(obj.button)
    obj.button = $(obj.button)  if is_string(obj.button)
    obj.key = cf_getKeyCode(obj.key)  if is_string(obj.key)
    obj
  go_getPaginationObject = ($tt, obj) ->
    obj = go_getNaviObject($tt, obj)
    if is_jquery(obj)
      obj = container: obj
    else obj = keys: obj  if is_boolean(obj)
    obj
  go_complementPaginationObject = ($tt, obj) ->
    obj.container = obj.container.call($tt)  if is_function(obj.container)
    obj.container = $(obj.container)  if is_string(obj.container)
    obj.items = false  unless is_number(obj.items)
    obj.keys = false  unless is_boolean(obj.keys)
    obj.anchorBuilder = $.fn.carouFredSel.pageAnchorBuilder  if not is_function(obj.anchorBuilder) and not is_false(obj.anchorBuilder)
    obj.deviation = 0  unless is_number(obj.deviation)
    obj
  go_getSwipeObject = ($tt, obj) ->
    obj = obj.call($tt)  if is_function(obj)
    obj = onTouch: false  if is_undefined(obj)
    if is_true(obj)
      obj = onTouch: obj
    else obj = items: obj  if is_number(obj)
    obj
  go_complementSwipeObject = ($tt, obj) ->
    obj.onTouch = true  unless is_boolean(obj.onTouch)
    obj.onMouse = false  unless is_boolean(obj.onMouse)
    obj.options = {}  unless is_object(obj.options)
    obj.options.triggerOnTouchEnd = false  unless is_boolean(obj.options.triggerOnTouchEnd)
    obj
  go_getMousewheelObject = ($tt, obj) ->
    obj = obj.call($tt)  if is_function(obj)
    if is_true(obj)
      obj = {}
    else if is_number(obj)
      obj = items: obj
    else obj = false  if is_undefined(obj)
    obj
  go_complementMousewheelObject = ($tt, obj) ->
    obj
  
  #	get number functions
  gn_getItemIndex = (num, dev, org, items, $cfs) ->
    num = $(num, $cfs)  if is_string(num)
    num = $(num, $cfs)  if is_object(num)
    if is_jquery(num)
      num = $cfs.children().index(num)
      org = false  unless is_boolean(org)
    else
      org = true  unless is_boolean(org)
    num = 0  unless is_number(num)
    dev = 0  unless is_number(dev)
    num += items.first  if org
    num += dev
    if items.total > 0
      num -= items.total  while num >= items.total
      num += items.total  while num < 0
    num
  
  #	items prev
  gn_getVisibleItemsPrev = (i, o, s) ->
    t = 0
    x = 0
    a = s

    while a >= 0
      j = i.eq(a)
      t += (if (j.is(":visible")) then j[o.d["outerWidth"]](true) else 0)
      return x  if t > o.maxDimension
      a = i.length  if a is 0
      x++
      a--
  gn_getVisibleItemsPrevFilter = (i, o, s) ->
    gn_getItemsPrevFilter i, o.items.filter, o.items.visibleConf.org, s
  gn_getScrollItemsPrevFilter = (i, o, s, m) ->
    gn_getItemsPrevFilter i, o.items.filter, m, s
  gn_getItemsPrevFilter = (i, f, m, s) ->
    t = 0
    x = 0
    a = s
    l = i.length

    while a >= 0
      x++
      return x  if x is l
      j = i.eq(a)
      if j.is(f)
        t++
        return x  if t is m
      a = l  if a is 0
      a--
  gn_getVisibleOrg = ($c, o) ->
    o.items.visibleConf.org or $c.children().slice(0, o.items.visible).filter(o.items.filter).length
  
  #	items next
  gn_getVisibleItemsNext = (i, o, s) ->
    t = 0
    x = 0
    a = s
    l = i.length - 1

    while a <= l
      j = i.eq(a)
      t += (if (j.is(":visible")) then j[o.d["outerWidth"]](true) else 0)
      return x  if t > o.maxDimension
      x++
      return x  if x is l + 1
      a = -1  if a is l
      a++
  gn_getVisibleItemsNextTestCircular = (i, o, s, l) ->
    v = gn_getVisibleItemsNext(i, o, s)
    v = l - s  if s + v > l  unless o.circular
    v
  gn_getVisibleItemsNextFilter = (i, o, s) ->
    gn_getItemsNextFilter i, o.items.filter, o.items.visibleConf.org, s, o.circular
  gn_getScrollItemsNextFilter = (i, o, s, m) ->
    gn_getItemsNextFilter(i, o.items.filter, m + 1, s, o.circular) - 1
  gn_getItemsNextFilter = (i, f, m, s, c) ->
    t = 0
    x = 0
    a = s
    l = i.length - 1

    while a <= l
      x++
      return x  if x >= l
      j = i.eq(a)
      if j.is(f)
        t++
        return x  if t is m
      a = -1  if a is l
      a++
  
  #	get items functions
  gi_getCurrentItems = (i, o) ->
    i.slice 0, o.items.visible
  gi_getOldItemsPrev = (i, o, n) ->
    i.slice n, o.items.visibleConf.old + n
  gi_getNewItemsPrev = (i, o) ->
    i.slice 0, o.items.visible
  gi_getOldItemsNext = (i, o) ->
    i.slice 0, o.items.visibleConf.old
  gi_getNewItemsNext = (i, o, n) ->
    i.slice n, o.items.visible + n
  
  #	sizes functions
  sz_storeMargin = (i, o, d) ->
    if o.usePadding
      d = "_cfs_origCssMargin"  unless is_string(d)
      i.each ->
        j = $(this)
        m = parseInt(j.css(o.d["marginRight"]), 10)
        m = 0  unless is_number(m)
        j.data d, m

  sz_resetMargin = (i, o, m) ->
    if o.usePadding
      x = (if (is_boolean(m)) then m else false)
      m = 0  unless is_number(m)
      sz_storeMargin i, o, "_cfs_tempCssMargin"
      i.each ->
        j = $(this)
        j.css o.d["marginRight"], ((if (x) then j.data("_cfs_tempCssMargin") else m + j.data("_cfs_origCssMargin")))

  sz_storeOrigCss = (i) ->
    i.each ->
      j = $(this)
      j.data "_cfs_origCss", j.attr("style") or ""

  sz_restoreOrigCss = (i) ->
    i.each ->
      j = $(this)
      j.attr "style", j.data("_cfs_origCss") or ""

  sz_setResponsiveSizes = (o, all) ->
    visb = o.items.visible
    newS = o.items[o.d["width"]]
    seco = o[o.d["height"]]
    secp = is_percentage(seco)
    all.each ->
      $t = $(this)
      nw = newS - ms_getPaddingBorderMargin($t, o, "Width")
      $t[o.d["width"]] nw
      $t[o.d["height"]] ms_getPercentage(nw, seco)  if secp

  sz_setSizes = ($c, o) ->
    $w = $c.parent()
    $i = $c.children()
    $v = gi_getCurrentItems($i, o)
    sz = cf_mapWrapperSizes(ms_getSizes($v, o, true), o, false)
    $w.css sz
    if o.usePadding
      p = o.padding
      r = p[o.d[1]]
      r = 0  if o.align and r < 0
      $l = $v.last()
      $l.css o.d["marginRight"], $l.data("_cfs_origCssMargin") + r
      $c.css o.d["top"], p[o.d[0]]
      $c.css o.d["left"], p[o.d[3]]
    $c.css o.d["width"], sz[o.d["width"]] + (ms_getTotalSize($i, o, "width") * 2)
    $c.css o.d["height"], ms_getLargestSize($i, o, "height")
    sz
  
  #	measuring functions
  ms_getSizes = (i, o, wrapper) ->
    [ms_getTotalSize(i, o, "width", wrapper), ms_getLargestSize(i, o, "height", wrapper)]
  ms_getLargestSize = (i, o, dim, wrapper) ->
    wrapper = false  unless is_boolean(wrapper)
    return o[o.d[dim]]  if is_number(o[o.d[dim]]) and wrapper
    return o.items[o.d[dim]]  if is_number(o.items[o.d[dim]])
    dim = (if (dim.toLowerCase().indexOf("width") > -1) then "outerWidth" else "outerHeight")
    ms_getTrueLargestSize i, o, dim
  ms_getTrueLargestSize = (i, o, dim) ->
    s = 0
    a = 0
    l = i.length

    while a < l
      j = i.eq(a)
      m = (if (j.is(":visible")) then j[o.d[dim]](true) else 0)
      s = m  if s < m
      a++
    s
  ms_getTotalSize = (i, o, dim, wrapper) ->
    wrapper = false  unless is_boolean(wrapper)
    return o[o.d[dim]]  if is_number(o[o.d[dim]]) and wrapper
    return o.items[o.d[dim]] * i.length  if is_number(o.items[o.d[dim]])
    d = (if (dim.toLowerCase().indexOf("width") > -1) then "outerWidth" else "outerHeight")
    s = 0
    a = 0
    l = i.length

    while a < l
      j = i.eq(a)
      s += (if (j.is(":visible")) then j[o.d[d]](true) else 0)
      a++
    s
  ms_getParentSize = ($w, o, d) ->
    isVisible = $w.is(":visible")
    $w.hide()  if isVisible
    s = $w.parent()[o.d[d]]()
    $w.show()  if isVisible
    s
  ms_getMaxDimension = (o, a) ->
    (if (is_number(o[o.d["width"]])) then o[o.d["width"]] else a)
  ms_hasVariableSizes = (i, o, dim) ->
    s = false
    v = false
    a = 0
    l = i.length

    while a < l
      j = i.eq(a)
      c = (if (j.is(":visible")) then j[o.d[dim]](true) else 0)
      if s is false
        s = c
      else v = true  unless s is c
      v = true  if s is 0
      a++
    v
  ms_getPaddingBorderMargin = (i, o, d) ->
    i[o.d["outer" + d]](true) - i[o.d[d.toLowerCase()]]()
  ms_getPercentage = (s, o) ->
    if is_percentage(o)
      o = parseInt(o.slice(0, -1), 10)
      return s  unless is_number(o)
      s *= o / 100
    s
  
  #	config functions
  cf_e = (n, c, pf, ns, rd) ->
    pf = true  unless is_boolean(pf)
    ns = true  unless is_boolean(ns)
    rd = false  unless is_boolean(rd)
    n = c.events.prefix + n  if pf
    n = n + "." + c.events.namespace  if ns
    n += c.serialNumber  if ns and rd
    n
  cf_c = (n, c) ->
    (if (is_string(c.classnames[n])) then c.classnames[n] else n)
  cf_mapWrapperSizes = (ws, o, p) ->
    p = true  unless is_boolean(p)
    pad = (if (o.usePadding and p) then o.padding else [0, 0, 0, 0])
    wra = {}
    wra[o.d["width"]] = ws[0] + pad[1] + pad[3]
    wra[o.d["height"]] = ws[1] + pad[0] + pad[2]
    wra
  cf_sortParams = (vals, typs) ->
    arr = []
    a = 0
    l1 = vals.length

    while a < l1
      b = 0
      l2 = typs.length

      while b < l2
        if typs[b].indexOf(typeof vals[a]) > -1 and is_undefined(arr[b])
          arr[b] = vals[a]
          break
        b++
      a++
    arr
  cf_getPadding = (p) ->
    return [0, 0, 0, 0]  if is_undefined(p)
    return [p, p, p, p]  if is_number(p)
    p = p.split("px").join("").split("em").join("").split(" ")  if is_string(p)
    return [0, 0, 0, 0]  unless is_array(p)
    i = 0

    while i < 4
      p[i] = parseInt(p[i], 10)
      i++
    switch p.length
      when 0
        [0, 0, 0, 0]
      when 1
        [p[0], p[0], p[0], p[0]]
      when 2
        [p[0], p[1], p[0], p[1]]
      when 3
        [p[0], p[1], p[2], p[1]]
      else
        [p[0], p[1], p[2], p[3]]
  cf_getAlignPadding = (itm, o) ->
    x = (if (is_number(o[o.d["width"]])) then Math.ceil(o[o.d["width"]] - ms_getTotalSize(itm, o, "width")) else 0)
    switch o.align
      when "left"
        [0, x]
      when "right"
        [x, 0]
      when "center"
      else
        [Math.ceil(x / 2), Math.floor(x / 2)]
  cf_getDimensions = (o) ->
    dm = [["width", "innerWidth", "outerWidth", "height", "innerHeight", "outerHeight", "left", "top", "marginRight", 0, 1, 2, 3], ["height", "innerHeight", "outerHeight", "width", "innerWidth", "outerWidth", "top", "left", "marginBottom", 3, 2, 1, 0]]
    dl = dm[0].length
    dx = (if (o.direction is "right" or o.direction is "left") then 0 else 1)
    dimensions = {}
    d = 0

    while d < dl
      dimensions[dm[0][d]] = dm[dx][d]
      d++
    dimensions
  cf_getAdjust = (x, o, a, $t) ->
    v = x
    if is_function(a)
      v = a.call($t, v)
    else if is_string(a)
      p = a.split("+")
      m = a.split("-")
      if m.length > p.length
        neg = true
        sta = m[0]
        adj = m[1]
      else
        neg = false
        sta = p[0]
        adj = p[1]
      switch sta
        when "even"
          v = (if (x % 2 is 1) then x - 1 else x)
        when "odd"
          v = (if (x % 2 is 0) then x - 1 else x)
        else
          v = x
      adj = parseInt(adj, 10)
      if is_number(adj)
        adj = -adj  if neg
        v += adj
    v = 1  if not is_number(v) or v < 1
    v
  cf_getItemsAdjust = (x, o, a, $t) ->
    cf_getItemAdjustMinMax cf_getAdjust(x, o, a, $t), o.items.visibleConf
  cf_getItemAdjustMinMax = (v, i) ->
    v = i.min  if is_number(i.min) and v < i.min
    v = i.max  if is_number(i.max) and v > i.max
    v = 1  if v < 1
    v
  cf_getSynchArr = (s) ->
    s = [[s]]  unless is_array(s)
    s = [s]  unless is_array(s[0])
    j = 0
    l = s.length

    while j < l
      s[j][0] = $(s[j][0])  if is_string(s[j][0])
      s[j][1] = true  unless is_boolean(s[j][1])
      s[j][2] = true  unless is_boolean(s[j][2])
      s[j][3] = 0  unless is_number(s[j][3])
      j++
    s
  cf_getKeyCode = (k) ->
    return 39  if k is "right"
    return 37  if k is "left"
    return 38  if k is "up"
    return 40  if k is "down"
    -1
  cf_setCookie = (n, $c, c) ->
    if n
      v = $c.triggerHandler(cf_e("currentPosition", c))
      $.fn.carouFredSel.cookie.set n, v
  cf_getCookie = (n) ->
    c = $.fn.carouFredSel.cookie.get(n)
    (if (c is "") then 0 else c)
  
  #	init function
  in_mapCss = ($elem, props) ->
    css = {}
    p = 0
    l = props.length

    while p < l
      css[props[p]] = $elem.css(props[p])
      p++
    css
  in_complementItems = (obj, opt, itm, sta) ->
    obj.visibleConf = {}  unless is_object(obj.visibleConf)
    obj.sizesConf = {}  unless is_object(obj.sizesConf)
    obj.start = sta  if obj.start is 0 and is_number(sta)
    
    #	visible items
    if is_object(obj.visible)
      obj.visibleConf.min = obj.visible.min
      obj.visibleConf.max = obj.visible.max
      obj.visible = false
    else if is_string(obj.visible)
      
      #	variable visible items
      if obj.visible is "variable"
        obj.visibleConf.variable = true
      
      #	adjust string visible items
      else
        obj.visibleConf.adjust = obj.visible
      obj.visible = false
    else if is_function(obj.visible)
      obj.visibleConf.adjust = obj.visible
      obj.visible = false
    
    #	set items filter
    obj.filter = (if (itm.filter(":hidden").length > 0) then ":visible" else "*")  unless is_string(obj.filter)
    
    #	primary item-size not set
    unless obj[opt.d["width"]]
      
      #	responsive carousel -> set to largest
      if opt.responsive
        debug true, "Set a " + opt.d["width"] + " for the items!"
        obj[opt.d["width"]] = ms_getTrueLargestSize(itm, opt, "outerWidth")
      
      #	 non-responsive -> measure it or set to "variable"
      else
        obj[opt.d["width"]] = (if (ms_hasVariableSizes(itm, opt, "outerWidth")) then "variable" else itm[opt.d["outerWidth"]](true))
    
    #	secondary item-size not set -> measure it or set to "variable"
    obj[opt.d["height"]] = (if (ms_hasVariableSizes(itm, opt, "outerHeight")) then "variable" else itm[opt.d["outerHeight"]](true))  unless obj[opt.d["height"]]
    obj.sizesConf.width = obj.width
    obj.sizesConf.height = obj.height
    obj
  in_complementVisibleItems = (opt, avl) ->
    
    #	primary item-size variable -> set visible items variable
    opt.items.visibleConf.variable = true  if opt.items[opt.d["width"]] is "variable"
    unless opt.items.visibleConf.variable
      
      #	primary size is number -> calculate visible-items
      if is_number(opt[opt.d["width"]])
        opt.items.visible = Math.floor(opt[opt.d["width"]] / opt.items[opt.d["width"]])
      
      #	measure and calculate primary size and visible-items
      else
        opt.items.visible = Math.floor(avl / opt.items[opt.d["width"]])
        opt[opt.d["width"]] = opt.items.visible * opt.items[opt.d["width"]]
        opt.align = false  unless opt.items.visibleConf.adjust
      if opt.items.visible is "Infinity" or opt.items.visible < 1
        debug true, "Not a valid number of visible items: Set to \"variable\"."
        opt.items.visibleConf.variable = true
    opt
  in_complementPrimarySize = (obj, opt, all) ->
    
    #	primary size set to auto -> measure largest item-size and set it
    obj = ms_getTrueLargestSize(all, opt, "outerWidth")  if obj is "auto"
    obj
  in_complementSecondarySize = (obj, opt, all) ->
    
    #	secondary size set to auto -> measure largest item-size and set it
    obj = ms_getTrueLargestSize(all, opt, "outerHeight")  if obj is "auto"
    
    #	secondary size not set -> set to secondary item-size
    obj = opt.items[opt.d["height"]]  unless obj
    obj
  in_getAlignPadding = (o, all) ->
    p = cf_getAlignPadding(gi_getCurrentItems(all, o), o)
    o.padding[o.d[1]] = p[1]
    o.padding[o.d[3]] = p[0]
    o
  in_getResponsiveValues = (o, all, avl) ->
    visb = cf_getItemAdjustMinMax(Math.ceil(o[o.d["width"]] / o.items[o.d["width"]]), o.items.visibleConf)
    visb = all.length  if visb > all.length
    newS = Math.floor(o[o.d["width"]] / visb)
    o.items.visible = visb
    o.items[o.d["width"]] = newS
    o[o.d["width"]] = visb * newS
    o
  
  #	buttons functions
  bt_pauseOnHoverConfig = (p) ->
    if is_string(p)
      i = (if (p.indexOf("immediate") > -1) then true else false)
      r = (if (p.indexOf("resume") > -1) then true else false)
    else
      i = r = false
    [i, r]
  bt_mousesheelNumber = (mw) ->
    (if (is_number(mw)) then mw else null)
  
  #	helper functions
  is_null = (a) ->
    a is null
  is_undefined = (a) ->
    is_null(a) or typeof a is "undefined" or a is "" or a is "undefined"
  is_array = (a) ->
    a instanceof Array
  is_jquery = (a) ->
    a instanceof jQuery
  is_object = (a) ->
    (a instanceof Object or typeof a is "object") and not is_null(a) and not is_jquery(a) and not is_array(a) and not is_function(a)
  is_number = (a) ->
    (a instanceof Number or typeof a is "number") and not isNaN(a)
  is_string = (a) ->
    (a instanceof String or typeof a is "string") and not is_undefined(a) and not is_true(a) and not is_false(a)
  is_function = (a) ->
    a instanceof Function or typeof a is "function"
  is_boolean = (a) ->
    a instanceof Boolean or typeof a is "boolean" or is_true(a) or is_false(a)
  is_true = (a) ->
    a is true or a is "true"
  is_false = (a) ->
    a is false or a is "false"
  is_percentage = (x) ->
    is_string(x) and x.slice(-1) is "%"
  getTime = ->
    new Date().getTime()
  deprecated = (o, n) ->
    debug true, o + " is DEPRECATED, support for it will be removed. Use " + n + " instead."
  debug = (d, m) ->
    if not is_undefined(window.console) and not is_undefined(window.console.log)
      if is_object(d)
        s = " (" + d.selector + ")"
        d = d.debug
      else
        s = ""
      return false  unless d
      if is_string(m)
        m = "carouFredSel" + s + ": " + m
      else
        m = ["carouFredSel" + s + ":", m]
      window.console.log m
    false
  return  if $.fn.carouFredSel
  $.fn.caroufredsel = $.fn.carouFredSel = (options, configs) ->
    if @length is 0
      debug true, "No element found for \"" + @selector + "\"."
      return this
    if @length > 1
      return @each(->
        $(this).carouFredSel options, configs
      )
    $cfs = this
    $tt0 = this[0]
    starting_position = false
    if $cfs.data("_cfs_isCarousel")
      starting_position = $cfs.triggerHandler("_cfs_triggerEvent", "currentPosition")
      $cfs.trigger "_cfs_triggerEvent", ["destroy", true]
    FN = {}
    FN._init = (o, setOrig, start) ->
      o = go_getObject($tt0, o)
      o.items = go_getItemsObject($tt0, o.items)
      o.scroll = go_getScrollObject($tt0, o.scroll)
      o.auto = go_getAutoObject($tt0, o.auto)
      o.prev = go_getPrevNextObject($tt0, o.prev)
      o.next = go_getPrevNextObject($tt0, o.next)
      o.pagination = go_getPaginationObject($tt0, o.pagination)
      o.swipe = go_getSwipeObject($tt0, o.swipe)
      o.mousewheel = go_getMousewheelObject($tt0, o.mousewheel)
      opts_orig = $.extend(true, {}, $.fn.carouFredSel.defaults, o)  if setOrig
      opts = $.extend(true, {}, $.fn.carouFredSel.defaults, o)
      opts.d = cf_getDimensions(opts)
      crsl.direction = (if (opts.direction is "up" or opts.direction is "left") then "next" else "prev")
      a_itm = $cfs.children()
      avail_primary = ms_getParentSize($wrp, opts, "width")
      opts.cookie = "caroufredsel_cookie_" + conf.serialNumber  if is_true(opts.cookie)
      opts.maxDimension = ms_getMaxDimension(opts, avail_primary)
      opts.items = in_complementItems(opts.items, opts, a_itm, start)
      opts[opts.d["width"]] = in_complementPrimarySize(opts[opts.d["width"]], opts, a_itm)
      opts[opts.d["height"]] = in_complementSecondarySize(opts[opts.d["height"]], opts, a_itm)
      opts[opts.d["width"]] = "100%"  unless is_percentage(opts[opts.d["width"]])  if opts.responsive
      if is_percentage(opts[opts.d["width"]])
        crsl.upDateOnWindowResize = true
        crsl.primarySizePercentage = opts[opts.d["width"]]
        opts[opts.d["width"]] = ms_getPercentage(avail_primary, crsl.primarySizePercentage)
        opts.items.visibleConf.variable = true  unless opts.items.visible
      if opts.responsive
        opts.usePadding = false
        opts.padding = [0, 0, 0, 0]
        opts.align = false
        opts.items.visibleConf.variable = false
      else
        opts = in_complementVisibleItems(opts, avail_primary)  unless opts.items.visible
        unless opts[opts.d["width"]]
          if not opts.items.visibleConf.variable and is_number(opts.items[opts.d["width"]]) and opts.items.filter is "*"
            opts[opts.d["width"]] = opts.items.visible * opts.items[opts.d["width"]]
            opts.align = false
          else
            opts[opts.d["width"]] = "variable"
        opts.align = (if (is_number(opts[opts.d["width"]])) then "center" else false)  if is_undefined(opts.align)
        opts.items.visible = gn_getVisibleItemsNext(a_itm, opts, 0)  if opts.items.visibleConf.variable
      if opts.items.filter isnt "*" and not opts.items.visibleConf.variable
        opts.items.visibleConf.org = opts.items.visible
        opts.items.visible = gn_getVisibleItemsNextFilter(a_itm, opts, 0)
      opts.items.visible = cf_getItemsAdjust(opts.items.visible, opts, opts.items.visibleConf.adjust, $tt0)
      opts.items.visibleConf.old = opts.items.visible
      if opts.responsive
        opts.items.visibleConf.min = opts.items.visible  unless opts.items.visibleConf.min
        opts.items.visibleConf.max = opts.items.visible  unless opts.items.visibleConf.max
        opts = in_getResponsiveValues(opts, a_itm, avail_primary)
      else
        opts.padding = cf_getPadding(opts.padding)
        if opts.align is "top"
          opts.align = "left"
        else opts.align = "right"  if opts.align is "bottom"
        switch opts.align
          when "center", "left"
        , "right"
            unless opts[opts.d["width"]] is "variable"
              opts = in_getAlignPadding(opts, a_itm)
              opts.usePadding = true
          else
            opts.align = false
            opts.usePadding = (if (opts.padding[0] is 0 and opts.padding[1] is 0 and opts.padding[2] is 0 and opts.padding[3] is 0) then false else true)
      opts.scroll.duration = 500  unless is_number(opts.scroll.duration)
      opts.scroll.items = (if (opts.responsive or opts.items.visibleConf.variable or opts.items.filter isnt "*") then "visible" else opts.items.visible)  if is_undefined(opts.scroll.items)
      opts.auto = $.extend(true, {}, opts.scroll, opts.auto)
      opts.prev = $.extend(true, {}, opts.scroll, opts.prev)
      opts.next = $.extend(true, {}, opts.scroll, opts.next)
      opts.pagination = $.extend(true, {}, opts.scroll, opts.pagination)
      opts.auto = go_complementAutoObject($tt0, opts.auto)
      opts.prev = go_complementPrevNextObject($tt0, opts.prev)
      opts.next = go_complementPrevNextObject($tt0, opts.next)
      opts.pagination = go_complementPaginationObject($tt0, opts.pagination)
      opts.swipe = go_complementSwipeObject($tt0, opts.swipe)
      opts.mousewheel = go_complementMousewheelObject($tt0, opts.mousewheel)
      opts.synchronise = cf_getSynchArr(opts.synchronise)  if opts.synchronise
      if opts.auto.onPauseStart
        opts.auto.onTimeoutStart = opts.auto.onPauseStart
        deprecated "auto.onPauseStart", "auto.onTimeoutStart"
      if opts.auto.onPausePause
        opts.auto.onTimeoutPause = opts.auto.onPausePause
        deprecated "auto.onPausePause", "auto.onTimeoutPause"
      if opts.auto.onPauseEnd
        opts.auto.onTimeoutEnd = opts.auto.onPauseEnd
        deprecated "auto.onPauseEnd", "auto.onTimeoutEnd"
      if opts.auto.pauseDuration
        opts.auto.timeoutDuration = opts.auto.pauseDuration
        deprecated "auto.pauseDuration", "auto.timeoutDuration"

    FN._build = ->
      $cfs.data "_cfs_isCarousel", true
      a_itm = $cfs.children()
      orgCSS = in_mapCss($cfs, ["textAlign", "float", "position", "top", "right", "bottom", "left", "zIndex", "width", "height", "marginTop", "marginRight", "marginBottom", "marginLeft"])
      newPosition = "relative"
      switch orgCSS.position
        when "absolute", "fixed"
          newPosition = orgCSS.position
      if conf.wrapper is "parent"
        sz_storeOrigCss $wrp
      else
        $wrp.css orgCSS
      $wrp.css
        overflow: "hidden"
        position: newPosition

      sz_storeOrigCss $cfs
      $cfs.data "_cfs_origCssZindex", orgCSS.zIndex
      $cfs.css
        textAlign: "left"
        float: "none"
        position: "absolute"
        top: 0
        right: "auto"
        bottom: "auto"
        left: 0
        marginTop: 0
        marginRight: 0
        marginBottom: 0
        marginLeft: 0

      sz_storeMargin a_itm, opts
      sz_storeOrigCss a_itm
      sz_setResponsiveSizes opts, a_itm  if opts.responsive

    FN._bind_events = ->
      FN._unbind_events()
      $cfs.bind cf_e("stop", conf), (e, imm) ->
        e.stopPropagation()
        opts.auto.button.addClass cf_c("stopped", conf)  if opts.auto.button  unless crsl.isStopped
        crsl.isStopped = true
        if opts.auto.play
          opts.auto.play = false
          $cfs.trigger cf_e("pause", conf), imm
        true

      $cfs.bind cf_e("finish", conf), (e) ->
        e.stopPropagation()
        sc_stopScroll scrl  if crsl.isScrolling
        true

      $cfs.bind cf_e("pause", conf), (e, imm, res) ->
        e.stopPropagation()
        tmrs = sc_clearTimers(tmrs)
        if imm and crsl.isScrolling
          scrl.isStopped = true
          nst = getTime() - scrl.startTime
          scrl.duration -= nst
          scrl.pre.duration -= nst  if scrl.pre
          scrl.post.duration -= nst  if scrl.post
          sc_stopScroll scrl, false
        tmrs.timePassed += getTime() - tmrs.startTime  if res  if not crsl.isPaused and not crsl.isScrolling
        opts.auto.button.addClass cf_c("paused", conf)  if opts.auto.button  unless crsl.isPaused
        crsl.isPaused = true
        if opts.auto.onTimeoutPause
          dur1 = opts.auto.timeoutDuration - tmrs.timePassed
          perc = 100 - Math.ceil(dur1 * 100 / opts.auto.timeoutDuration)
          opts.auto.onTimeoutPause.call $tt0, perc, dur1
        true

      $cfs.bind cf_e("play", conf), (e, dir, del, res) ->
        e.stopPropagation()
        tmrs = sc_clearTimers(tmrs)
        v = [dir, del, res]
        t = ["string", "number", "boolean"]
        a = cf_sortParams(v, t)
        dir = a[0]
        del = a[1]
        res = a[2]
        dir = crsl.direction  if dir isnt "prev" and dir isnt "next"
        del = 0  unless is_number(del)
        res = false  unless is_boolean(res)
        if res
          crsl.isStopped = false
          opts.auto.play = true
        unless opts.auto.play
          e.stopImmediatePropagation()
          return debug(conf, "Carousel stopped: Not scrolling.")
        if crsl.isPaused
          if opts.auto.button
            opts.auto.button.removeClass cf_c("stopped", conf)
            opts.auto.button.removeClass cf_c("paused", conf)
        crsl.isPaused = false
        tmrs.startTime = getTime()
        dur1 = opts.auto.timeoutDuration + del
        dur2 = dur1 - tmrs.timePassed
        perc = 100 - Math.ceil(dur2 * 100 / dur1)
        if opts.auto.progress
          tmrs.progress = setInterval(->
            pasd = getTime() - tmrs.startTime + tmrs.timePassed
            perc = Math.ceil(pasd * 100 / dur1)
            opts.auto.progress.updater.call opts.auto.progress.bar[0], perc
          , opts.auto.progress.interval)
        tmrs.auto = setTimeout(->
          opts.auto.progress.updater.call opts.auto.progress.bar[0], 100  if opts.auto.progress
          opts.auto.onTimeoutEnd.call $tt0, perc, dur2  if opts.auto.onTimeoutEnd
          if crsl.isScrolling
            $cfs.trigger cf_e("play", conf), dir
          else
            $cfs.trigger cf_e(dir, conf), opts.auto
        , dur2)
        opts.auto.onTimeoutStart.call $tt0, perc, dur2  if opts.auto.onTimeoutStart
        true

      $cfs.bind cf_e("resume", conf), (e) ->
        e.stopPropagation()
        if scrl.isStopped
          scrl.isStopped = false
          crsl.isPaused = false
          crsl.isScrolling = true
          scrl.startTime = getTime()
          sc_startScroll scrl, conf
        else
          $cfs.trigger cf_e("play", conf)
        true

      $cfs.bind cf_e("prev", conf) + " " + cf_e("next", conf), (e, obj, num, clb, que) ->
        e.stopPropagation()
        if crsl.isStopped or $cfs.is(":hidden")
          e.stopImmediatePropagation()
          return debug(conf, "Carousel stopped or hidden: Not scrolling.")
        minimum = (if (is_number(opts.items.minimum)) then opts.items.minimum else opts.items.visible + 1)
        if minimum > itms.total
          e.stopImmediatePropagation()
          return debug(conf, "Not enough items (" + itms.total + " total, " + minimum + " needed): Not scrolling.")
        v = [obj, num, clb, que]
        t = ["object", "number/string", "function", "boolean"]
        a = cf_sortParams(v, t)
        obj = a[0]
        num = a[1]
        clb = a[2]
        que = a[3]
        eType = e.type.slice(conf.events.prefix.length)
        obj = {}  unless is_object(obj)
        obj.onAfter = clb  if is_function(clb)
        obj.queue = que  if is_boolean(que)
        obj = $.extend(true, {}, opts[eType], obj)
        if obj.conditions and not obj.conditions.call($tt0, eType)
          e.stopImmediatePropagation()
          return debug(conf, "Callback \"conditions\" returned false.")
        unless is_number(num)
          unless opts.items.filter is "*"
            num = "visible"
          else
            arr = [num, obj.items, opts[eType].items]
            a = 0
            l = arr.length

            while a < l
              if is_number(arr[a]) or arr[a] is "page" or arr[a] is "visible"
                num = arr[a]
                break
              a++
          switch num
            when "page"
              e.stopImmediatePropagation()
              return $cfs.triggerHandler(cf_e(eType + "Page", conf), [obj, clb])
            when "visible"
              num = opts.items.visible  if not opts.items.visibleConf.variable and opts.items.filter is "*"
        if scrl.isStopped
          $cfs.trigger cf_e("resume", conf)
          $cfs.trigger cf_e("queue", conf), [eType, [obj, num, clb]]
          e.stopImmediatePropagation()
          return debug(conf, "Carousel resumed scrolling.")
        if obj.duration > 0
          if crsl.isScrolling
            if obj.queue
              queu = []  if obj.queue is "last"
              $cfs.trigger cf_e("queue", conf), [eType, [obj, num, clb]]  if obj.queue isnt "first" or queu.length is 0
            e.stopImmediatePropagation()
            return debug(conf, "Carousel currently scrolling.")
        tmrs.timePassed = 0
        $cfs.trigger cf_e("slide_" + eType, conf), [obj, num]
        if opts.synchronise
          s = opts.synchronise
          c = [obj, num]
          j = 0
          l = s.length

          while j < l
            d = eType
            d = (if (d is "prev") then "next" else "prev")  unless s[j][2]
            c[0] = s[j][0].triggerHandler("_cfs_triggerEvent", ["configuration", d])  unless s[j][1]
            c[1] = num + s[j][3]
            s[j][0].trigger "_cfs_triggerEvent", ["slide_" + d, c]
            j++
        true

      $cfs.bind cf_e("slide_prev", conf), (e, sO, nI) ->
        e.stopPropagation()
        a_itm = $cfs.children()
        unless opts.circular
          if itms.first is 0
            $cfs.trigger cf_e("next", conf), itms.total - 1  if opts.infinite
            return e.stopImmediatePropagation()
        sz_resetMargin a_itm, opts
        unless is_number(nI)
          if opts.items.visibleConf.variable
            nI = gn_getVisibleItemsPrev(a_itm, opts, itms.total - 1)
          else unless opts.items.filter is "*"
            xI = (if (is_number(sO.items)) then sO.items else gn_getVisibleOrg($cfs, opts))
            nI = gn_getScrollItemsPrevFilter(a_itm, opts, itms.total - 1, xI)
          else
            nI = opts.items.visible
          nI = cf_getAdjust(nI, opts, sO.items, $tt0)
        nI = itms.total - itms.first  if itms.total - nI < itms.first  unless opts.circular
        opts.items.visibleConf.old = opts.items.visible
        if opts.items.visibleConf.variable
          vI = cf_getItemsAdjust(gn_getVisibleItemsNext(a_itm, opts, itms.total - nI), opts, opts.items.visibleConf.adjust, $tt0)
          if opts.items.visible + nI <= vI and nI < itms.total
            nI++
            vI = cf_getItemsAdjust(gn_getVisibleItemsNext(a_itm, opts, itms.total - nI), opts, opts.items.visibleConf.adjust, $tt0)
          opts.items.visible = vI
        else unless opts.items.filter is "*"
          vI = gn_getVisibleItemsNextFilter(a_itm, opts, itms.total - nI)
          opts.items.visible = cf_getItemsAdjust(vI, opts, opts.items.visibleConf.adjust, $tt0)
        sz_resetMargin a_itm, opts, true
        if nI is 0
          e.stopImmediatePropagation()
          return debug(conf, "0 items to scroll: Not scrolling.")
        debug conf, "Scrolling " + nI + " items backward."
        itms.first += nI
        itms.first -= itms.total  while itms.first >= itms.total
        unless opts.circular
          sO.onEnd.call $tt0, "prev"  if itms.first is 0 and sO.onEnd
          nv_enableNavi opts, itms.first, conf  unless opts.infinite
        $cfs.children().slice(itms.total - nI, itms.total).prependTo $cfs
        $cfs.children().slice(0, (opts.items.visible + nI) - itms.total).clone(true).appendTo $cfs  if itms.total < opts.items.visible + nI
        a_itm = $cfs.children()
        i_old = gi_getOldItemsPrev(a_itm, opts, nI)
        i_new = gi_getNewItemsPrev(a_itm, opts)
        i_cur_l = a_itm.eq(nI - 1)
        i_old_l = i_old.last()
        i_new_l = i_new.last()
        sz_resetMargin a_itm, opts
        pL = 0
        pR = 0
        if opts.align
          p = cf_getAlignPadding(i_new, opts)
          pL = p[0]
          pR = p[1]
        oL = (if (pL < 0) then opts.padding[opts.d[3]] else 0)
        hiddenitems = false
        i_skp = $()
        if opts.items.visible < nI
          i_skp = a_itm.slice(opts.items.visibleConf.old, nI)
          if sO.fx is "directscroll"
            orgW = opts.items[opts.d["width"]]
            hiddenitems = i_skp
            i_cur_l = i_new_l
            sc_hideHiddenItems hiddenitems
            opts.items[opts.d["width"]] = "variable"
        $cf2 = false
        i_siz = ms_getTotalSize(a_itm.slice(0, nI), opts, "width")
        w_siz = cf_mapWrapperSizes(ms_getSizes(i_new, opts, true), opts, not opts.usePadding)
        i_siz_vis = 0
        a_cfs = {}
        a_wsz = {}
        a_cur = {}
        a_old = {}
        a_new = {}
        a_lef = {}
        a_lef_vis = {}
        a_dur = sc_getDuration(sO, opts, nI, i_siz)
        switch sO.fx
          when "cover", "cover-fade"
            i_siz_vis = ms_getTotalSize(a_itm.slice(0, opts.items.visible), opts, "width")
        opts.items[opts.d["width"]] = orgW  if hiddenitems
        sz_resetMargin a_itm, opts, true
        sz_resetMargin i_old_l, opts, opts.padding[opts.d[1]]  if pR >= 0
        sz_resetMargin i_cur_l, opts, opts.padding[opts.d[3]]  if pL >= 0
        if opts.align
          opts.padding[opts.d[1]] = pR
          opts.padding[opts.d[3]] = pL
        a_lef[opts.d["left"]] = -(i_siz - oL)
        a_lef_vis[opts.d["left"]] = -(i_siz_vis - oL)
        a_wsz[opts.d["left"]] = w_siz[opts.d["width"]]
        _s_wrapper = ->

        _a_wrapper = ->

        _s_paddingold = ->

        _a_paddingold = ->

        _s_paddingnew = ->

        _a_paddingnew = ->

        _s_paddingcur = ->

        _a_paddingcur = ->

        _onafter = ->

        _moveitems = ->

        _position = ->

        switch sO.fx
          when "crossfade", "cover"
        , "cover-fade"
        , "uncover"
        , "uncover-fade"
            $cf2 = $cfs.clone(true).appendTo($wrp)
        switch sO.fx
          when "crossfade", "uncover"
        , "uncover-fade"
            $cf2.children().slice(0, nI).remove()
            $cf2.children().slice(opts.items.visibleConf.old).remove()
          when "cover", "cover-fade"
            $cf2.children().slice(opts.items.visible).remove()
            $cf2.css a_lef_vis
        $cfs.css a_lef
        scrl = sc_setScroll(a_dur, sO.easing, conf)
        a_cfs[opts.d["left"]] = (if (opts.usePadding) then opts.padding[opts.d[3]] else 0)
        if opts[opts.d["width"]] is "variable" or opts[opts.d["height"]] is "variable"
          _s_wrapper = ->
            $wrp.css w_siz

          _a_wrapper = ->
            scrl.anims.push [$wrp, w_siz]
        if opts.usePadding
          if i_new_l.not(i_cur_l).length
            a_cur[opts.d["marginRight"]] = i_cur_l.data("_cfs_origCssMargin")
            if pL < 0
              i_cur_l.css a_cur
            else
              _s_paddingcur = ->
                i_cur_l.css a_cur

              _a_paddingcur = ->
                scrl.anims.push [i_cur_l, a_cur]
          switch sO.fx
            when "cover", "cover-fade"
              $cf2.children().eq(nI - 1).css a_cur
          if i_new_l.not(i_old_l).length
            a_old[opts.d["marginRight"]] = i_old_l.data("_cfs_origCssMargin")
            _s_paddingold = ->
              i_old_l.css a_old

            _a_paddingold = ->
              scrl.anims.push [i_old_l, a_old]
          if pR >= 0
            a_new[opts.d["marginRight"]] = i_new_l.data("_cfs_origCssMargin") + opts.padding[opts.d[1]]
            _s_paddingnew = ->
              i_new_l.css a_new

            _a_paddingnew = ->
              scrl.anims.push [i_new_l, a_new]
        _position = ->
          $cfs.css a_cfs

        overFill = opts.items.visible + nI - itms.total
        _moveitems = ->
          if overFill > 0
            $cfs.children().slice(itms.total).remove()
            i_old = $($cfs.children().slice(itms.total - (opts.items.visible - overFill)).get().concat($cfs.children().slice(0, overFill).get()))
          sc_showHiddenItems hiddenitems
          if opts.usePadding
            l_itm = $cfs.children().eq(opts.items.visible + nI - 1)
            l_itm.css opts.d["marginRight"], l_itm.data("_cfs_origCssMargin")

        cb_arguments = sc_mapCallbackArguments(i_old, i_skp, i_new, nI, "prev", a_dur, w_siz)
        _onafter = ->
          sc_afterScroll $cfs, $cf2, sO
          crsl.isScrolling = false
          clbk.onAfter = sc_fireCallbacks($tt0, sO, "onAfter", cb_arguments, clbk)
          queu = sc_fireQueue($cfs, queu, conf)
          $cfs.trigger cf_e("play", conf)  unless crsl.isPaused

        crsl.isScrolling = true
        tmrs = sc_clearTimers(tmrs)
        clbk.onBefore = sc_fireCallbacks($tt0, sO, "onBefore", cb_arguments, clbk)
        switch sO.fx
          when "none"
            $cfs.css a_cfs
            _s_wrapper()
            _s_paddingold()
            _s_paddingnew()
            _s_paddingcur()
            _position()
            _moveitems()
            _onafter()
          when "fade"
            scrl.anims.push [$cfs,
              opacity: 0
            , ->
              _s_wrapper()
              _s_paddingold()
              _s_paddingnew()
              _s_paddingcur()
              _position()
              _moveitems()
              scrl = sc_setScroll(a_dur, sO.easing, conf)
              scrl.anims.push [$cfs,
                opacity: 1
              , _onafter]
              sc_startScroll scrl, conf
            ]
          when "crossfade"
            $cfs.css opacity: 0
            scrl.anims.push [$cf2,
              opacity: 0
            ]
            scrl.anims.push [$cfs,
              opacity: 1
            , _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingnew()
            _s_paddingcur()
            _position()
            _moveitems()
          when "cover"
            scrl.anims.push [$cf2, a_cfs, ->
              _s_paddingold()
              _s_paddingnew()
              _s_paddingcur()
              _position()
              _moveitems()
              _onafter()
            ]
            _a_wrapper()
          when "cover-fade"
            scrl.anims.push [$cfs,
              opacity: 0
            ]
            scrl.anims.push [$cf2, a_cfs, ->
              _s_paddingold()
              _s_paddingnew()
              _s_paddingcur()
              _position()
              _moveitems()
              _onafter()
            ]
            _a_wrapper()
          when "uncover"
            scrl.anims.push [$cf2, a_wsz, _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingnew()
            _s_paddingcur()
            _position()
            _moveitems()
          when "uncover-fade"
            $cfs.css opacity: 0
            scrl.anims.push [$cfs,
              opacity: 1
            ]
            scrl.anims.push [$cf2, a_wsz, _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingnew()
            _s_paddingcur()
            _position()
            _moveitems()
          else
            scrl.anims.push [$cfs, a_cfs, ->
              _moveitems()
              _onafter()
            ]
            _a_wrapper()
            _a_paddingold()
            _a_paddingnew()
            _a_paddingcur()
        sc_startScroll scrl, conf
        cf_setCookie opts.cookie, $cfs, conf
        $cfs.trigger cf_e("updatePageStatus", conf), [false, w_siz]
        true

      $cfs.bind cf_e("slide_next", conf), (e, sO, nI) ->
        e.stopPropagation()
        a_itm = $cfs.children()
        unless opts.circular
          if itms.first is opts.items.visible
            $cfs.trigger cf_e("prev", conf), itms.total - 1  if opts.infinite
            return e.stopImmediatePropagation()
        sz_resetMargin a_itm, opts
        unless is_number(nI)
          unless opts.items.filter is "*"
            xI = (if (is_number(sO.items)) then sO.items else gn_getVisibleOrg($cfs, opts))
            nI = gn_getScrollItemsNextFilter(a_itm, opts, 0, xI)
          else
            nI = opts.items.visible
          nI = cf_getAdjust(nI, opts, sO.items, $tt0)
        lastItemNr = (if (itms.first is 0) then itms.total else itms.first)
        unless opts.circular
          if opts.items.visibleConf.variable
            vI = gn_getVisibleItemsNext(a_itm, opts, nI)
            xI = gn_getVisibleItemsPrev(a_itm, opts, lastItemNr - 1)
          else
            vI = opts.items.visible
            xI = opts.items.visible
          nI = lastItemNr - xI  if nI + vI > lastItemNr
        opts.items.visibleConf.old = opts.items.visible
        if opts.items.visibleConf.variable
          vI = cf_getItemsAdjust(gn_getVisibleItemsNextTestCircular(a_itm, opts, nI, lastItemNr), opts, opts.items.visibleConf.adjust, $tt0)
          while opts.items.visible - nI >= vI and nI < itms.total
            nI++
            vI = cf_getItemsAdjust(gn_getVisibleItemsNextTestCircular(a_itm, opts, nI, lastItemNr), opts, opts.items.visibleConf.adjust, $tt0)
          opts.items.visible = vI
        else unless opts.items.filter is "*"
          vI = gn_getVisibleItemsNextFilter(a_itm, opts, nI)
          opts.items.visible = cf_getItemsAdjust(vI, opts, opts.items.visibleConf.adjust, $tt0)
        sz_resetMargin a_itm, opts, true
        if nI is 0
          e.stopImmediatePropagation()
          return debug(conf, "0 items to scroll: Not scrolling.")
        debug conf, "Scrolling " + nI + " items forward."
        itms.first -= nI
        itms.first += itms.total  while itms.first < 0
        unless opts.circular
          sO.onEnd.call $tt0, "next"  if itms.first is opts.items.visible and sO.onEnd
          nv_enableNavi opts, itms.first, conf  unless opts.infinite
        $cfs.children().slice(0, (opts.items.visible + nI) - itms.total).clone(true).appendTo $cfs  if itms.total < opts.items.visible + nI
        a_itm = $cfs.children()
        i_old = gi_getOldItemsNext(a_itm, opts)
        i_new = gi_getNewItemsNext(a_itm, opts, nI)
        i_cur_l = a_itm.eq(nI - 1)
        i_old_l = i_old.last()
        i_new_l = i_new.last()
        sz_resetMargin a_itm, opts
        pL = 0
        pR = 0
        if opts.align
          p = cf_getAlignPadding(i_new, opts)
          pL = p[0]
          pR = p[1]
        hiddenitems = false
        i_skp = $()
        if opts.items.visibleConf.old < nI
          i_skp = a_itm.slice(opts.items.visibleConf.old, nI)
          if sO.fx is "directscroll"
            orgW = opts.items[opts.d["width"]]
            hiddenitems = i_skp
            i_cur_l = i_old_l
            sc_hideHiddenItems hiddenitems
            opts.items[opts.d["width"]] = "variable"
        $cf2 = false
        i_siz = ms_getTotalSize(a_itm.slice(0, nI), opts, "width")
        w_siz = cf_mapWrapperSizes(ms_getSizes(i_new, opts, true), opts, not opts.usePadding)
        i_siz_vis = 0
        a_cfs = {}
        a_cfs_vis = {}
        a_cur = {}
        a_old = {}
        a_lef = {}
        a_dur = sc_getDuration(sO, opts, nI, i_siz)
        switch sO.fx
          when "uncover", "uncover-fade"
            i_siz_vis = ms_getTotalSize(a_itm.slice(0, opts.items.visibleConf.old), opts, "width")
        opts.items[opts.d["width"]] = orgW  if hiddenitems
        opts.padding[opts.d[1]] = 0  if opts.padding[opts.d[1]] < 0  if opts.align
        sz_resetMargin a_itm, opts, true
        sz_resetMargin i_old_l, opts, opts.padding[opts.d[1]]
        if opts.align
          opts.padding[opts.d[1]] = pR
          opts.padding[opts.d[3]] = pL
        a_lef[opts.d["left"]] = (if (opts.usePadding) then opts.padding[opts.d[3]] else 0)
        _s_wrapper = ->

        _a_wrapper = ->

        _s_paddingold = ->

        _a_paddingold = ->

        _s_paddingcur = ->

        _a_paddingcur = ->

        _onafter = ->

        _moveitems = ->

        _position = ->

        switch sO.fx
          when "crossfade", "cover"
        , "cover-fade"
        , "uncover"
        , "uncover-fade"
            $cf2 = $cfs.clone(true).appendTo($wrp)
            $cf2.children().slice(opts.items.visibleConf.old).remove()
        switch sO.fx
          when "crossfade", "cover"
        , "cover-fade"
            $cfs.css "zIndex", 1
            $cf2.css "zIndex", 0
        scrl = sc_setScroll(a_dur, sO.easing, conf)
        a_cfs[opts.d["left"]] = -i_siz
        a_cfs_vis[opts.d["left"]] = -i_siz_vis
        a_cfs[opts.d["left"]] += pL  if pL < 0
        if opts[opts.d["width"]] is "variable" or opts[opts.d["height"]] is "variable"
          _s_wrapper = ->
            $wrp.css w_siz

          _a_wrapper = ->
            scrl.anims.push [$wrp, w_siz]
        if opts.usePadding
          i_new_l_m = i_new_l.data("_cfs_origCssMargin")
          i_new_l_m += opts.padding[opts.d[1]]  if pR >= 0
          i_new_l.css opts.d["marginRight"], i_new_l_m
          a_old[opts.d["marginRight"]] = i_old_l.data("_cfs_origCssMargin")  if i_cur_l.not(i_old_l).length
          _s_paddingold = ->
            i_old_l.css a_old

          _a_paddingold = ->
            scrl.anims.push [i_old_l, a_old]

          i_cur_l_m = i_cur_l.data("_cfs_origCssMargin")
          i_cur_l_m += opts.padding[opts.d[3]]  if pL > 0
          a_cur[opts.d["marginRight"]] = i_cur_l_m
          _s_paddingcur = ->
            i_cur_l.css a_cur

          _a_paddingcur = ->
            scrl.anims.push [i_cur_l, a_cur]
        _position = ->
          $cfs.css a_lef

        overFill = opts.items.visible + nI - itms.total
        _moveitems = ->
          $cfs.children().slice(itms.total).remove()  if overFill > 0
          l_itm = $cfs.children().slice(0, nI).appendTo($cfs).last()
          i_new = gi_getCurrentItems(a_itm, opts)  if overFill > 0
          sc_showHiddenItems hiddenitems
          if opts.usePadding
            if itms.total < opts.items.visible + nI
              i_cur_l = $cfs.children().eq(opts.items.visible - 1)
              i_cur_l.css opts.d["marginRight"], i_cur_l.data("_cfs_origCssMargin") + opts.padding[opts.d[1]]
            l_itm.css opts.d["marginRight"], l_itm.data("_cfs_origCssMargin")

        cb_arguments = sc_mapCallbackArguments(i_old, i_skp, i_new, nI, "next", a_dur, w_siz)
        _onafter = ->
          $cfs.css "zIndex", $cfs.data("_cfs_origCssZindex")
          sc_afterScroll $cfs, $cf2, sO
          crsl.isScrolling = false
          clbk.onAfter = sc_fireCallbacks($tt0, sO, "onAfter", cb_arguments, clbk)
          queu = sc_fireQueue($cfs, queu, conf)
          $cfs.trigger cf_e("play", conf)  unless crsl.isPaused

        crsl.isScrolling = true
        tmrs = sc_clearTimers(tmrs)
        clbk.onBefore = sc_fireCallbacks($tt0, sO, "onBefore", cb_arguments, clbk)
        switch sO.fx
          when "none"
            $cfs.css a_cfs
            _s_wrapper()
            _s_paddingold()
            _s_paddingcur()
            _position()
            _moveitems()
            _onafter()
          when "fade"
            scrl.anims.push [$cfs,
              opacity: 0
            , ->
              _s_wrapper()
              _s_paddingold()
              _s_paddingcur()
              _position()
              _moveitems()
              scrl = sc_setScroll(a_dur, sO.easing, conf)
              scrl.anims.push [$cfs,
                opacity: 1
              , _onafter]
              sc_startScroll scrl, conf
            ]
          when "crossfade"
            $cfs.css opacity: 0
            scrl.anims.push [$cf2,
              opacity: 0
            ]
            scrl.anims.push [$cfs,
              opacity: 1
            , _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingcur()
            _position()
            _moveitems()
          when "cover"
            $cfs.css opts.d["left"], $wrp[opts.d["width"]]()
            scrl.anims.push [$cfs, a_lef, _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingcur()
            _moveitems()
          when "cover-fade"
            $cfs.css opts.d["left"], $wrp[opts.d["width"]]()
            scrl.anims.push [$cf2,
              opacity: 0
            ]
            scrl.anims.push [$cfs, a_lef, _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingcur()
            _moveitems()
          when "uncover"
            scrl.anims.push [$cf2, a_cfs_vis, _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingcur()
            _position()
            _moveitems()
          when "uncover-fade"
            $cfs.css opacity: 0
            scrl.anims.push [$cfs,
              opacity: 1
            ]
            scrl.anims.push [$cf2, a_cfs_vis, _onafter]
            _a_wrapper()
            _s_paddingold()
            _s_paddingcur()
            _position()
            _moveitems()
          else
            scrl.anims.push [$cfs, a_cfs, ->
              _position()
              _moveitems()
              _onafter()
            ]
            _a_wrapper()
            _a_paddingold()
            _a_paddingcur()
        sc_startScroll scrl, conf
        cf_setCookie opts.cookie, $cfs, conf
        $cfs.trigger cf_e("updatePageStatus", conf), [false, w_siz]
        true

      $cfs.bind cf_e("slideTo", conf), (e, num, dev, org, obj, dir, clb) ->
        e.stopPropagation()
        v = [num, dev, org, obj, dir, clb]
        t = ["string/number/object", "number", "boolean", "object", "string", "function"]
        a = cf_sortParams(v, t)
        obj = a[3]
        dir = a[4]
        clb = a[5]
        num = gn_getItemIndex(a[0], a[1], a[2], itms, $cfs)
        return false  if num is 0
        obj = false  unless is_object(obj)
        if dir isnt "prev" and dir isnt "next"
          if opts.circular
            dir = (if (num <= itms.total / 2) then "next" else "prev")
          else
            dir = (if (itms.first is 0 or itms.first > num) then "next" else "prev")
        num = itms.total - num  if dir is "prev"
        $cfs.trigger cf_e(dir, conf), [obj, num, clb]
        true

      $cfs.bind cf_e("prevPage", conf), (e, obj, clb) ->
        e.stopPropagation()
        cur = $cfs.triggerHandler(cf_e("currentPage", conf))
        $cfs.triggerHandler cf_e("slideToPage", conf), [cur - 1, obj, "prev", clb]

      $cfs.bind cf_e("nextPage", conf), (e, obj, clb) ->
        e.stopPropagation()
        cur = $cfs.triggerHandler(cf_e("currentPage", conf))
        $cfs.triggerHandler cf_e("slideToPage", conf), [cur + 1, obj, "next", clb]

      $cfs.bind cf_e("slideToPage", conf), (e, pag, obj, dir, clb) ->
        e.stopPropagation()
        pag = $cfs.triggerHandler(cf_e("currentPage", conf))  unless is_number(pag)
        ipp = opts.pagination.items or opts.items.visible
        max = Math.ceil(itms.total / ipp) - 1
        pag = max  if pag < 0
        pag = 0  if pag > max
        $cfs.triggerHandler cf_e("slideTo", conf), [pag * ipp, 0, true, obj, dir, clb]

      $cfs.bind cf_e("jumpToStart", conf), (e, s) ->
        e.stopPropagation()
        if s
          s = gn_getItemIndex(s, 0, true, itms, $cfs)
        else
          s = 0
        s += itms.first
        unless s is 0
          s -= itms.total  while s > itms.total  if itms.total > 0
          $cfs.prepend $cfs.children().slice(s, itms.total)
        true

      $cfs.bind cf_e("synchronise", conf), (e, s) ->
        e.stopPropagation()
        if s
          s = cf_getSynchArr(s)
        else if opts.synchronise
          s = opts.synchronise
        else
          return debug(conf, "No carousel to synchronise.")
        n = $cfs.triggerHandler(cf_e("currentPosition", conf))
        x = true
        j = 0
        l = s.length

        while j < l
          x = false  unless s[j][0].triggerHandler(cf_e("slideTo", conf), [n, s[j][3], true])
          j++
        x

      $cfs.bind cf_e("queue", conf), (e, dir, opt) ->
        e.stopPropagation()
        if is_function(dir)
          dir.call $tt0, queu
        else if is_array(dir)
          queu = dir
        else queu.push [dir, opt]  unless is_undefined(dir)
        queu

      $cfs.bind cf_e("insertItem", conf), (e, itm, num, org, dev) ->
        e.stopPropagation()
        v = [itm, num, org, dev]
        t = ["string/object", "string/number/object", "boolean", "number"]
        a = cf_sortParams(v, t)
        itm = a[0]
        num = a[1]
        org = a[2]
        dev = a[3]
        if is_object(itm) and not is_jquery(itm)
          itm = $(itm)
        else itm = $(itm)  if is_string(itm)
        return debug(conf, "Not a valid object.")  if not is_jquery(itm) or itm.length is 0
        num = "end"  if is_undefined(num)
        sz_storeMargin itm, opts
        sz_storeOrigCss itm
        orgNum = num
        before = "before"
        if num is "end"
          if org
            if itms.first is 0
              num = itms.total - 1
              before = "after"
            else
              num = itms.first
              itms.first += itm.length
            num = 0  if num < 0
          else
            num = itms.total - 1
            before = "after"
        else
          num = gn_getItemIndex(num, dev, org, itms, $cfs)
        $cit = $cfs.children().eq(num)
        if $cit.length
          $cit[before] itm
        else
          debug conf, "Correct insert-position not found! Appending item to the end."
          $cfs.append itm
        itms.first += itm.length  if num < itms.first  if orgNum isnt "end" and not org
        itms.total = $cfs.children().length
        itms.first -= itms.total  if itms.first >= itms.total
        $cfs.trigger cf_e("updateSizes", conf)
        $cfs.trigger cf_e("linkAnchors", conf)
        true

      $cfs.bind cf_e("removeItem", conf), (e, num, org, dev) ->
        e.stopPropagation()
        v = [num, org, dev]
        t = ["string/number/object", "boolean", "number"]
        a = cf_sortParams(v, t)
        num = a[0]
        org = a[1]
        dev = a[2]
        removed = false
        if num instanceof $ and num.length > 1
          $removed = $()
          num.each (i, el) ->
            $rem = $cfs.trigger(cf_e("removeItem", conf), [$(this), org, dev])
            $removed = $removed.add($rem)  if $rem

          return $removed
        if is_undefined(num) or num is "end"
          $removed = $cfs.children().last()
        else
          num = gn_getItemIndex(num, dev, org, itms, $cfs)
          $removed = $cfs.children().eq(num)
          itms.first -= $removed.length  if num < itms.first  if $removed.length
        if $removed and $removed.length
          $removed.detach()
          itms.total = $cfs.children().length
          $cfs.trigger cf_e("updateSizes", conf)
        $removed

      $cfs.bind cf_e("onBefore", conf) + " " + cf_e("onAfter", conf), (e, fn) ->
        e.stopPropagation()
        eType = e.type.slice(conf.events.prefix.length)
        clbk[eType] = fn  if is_array(fn)
        clbk[eType].push fn  if is_function(fn)
        clbk[eType]

      $cfs.bind cf_e("currentPosition", conf), (e, fn) ->
        e.stopPropagation()
        if itms.first is 0
          val = 0
        else
          val = itms.total - itms.first
        fn.call $tt0, val  if is_function(fn)
        val

      $cfs.bind cf_e("currentPage", conf), (e, fn) ->
        e.stopPropagation()
        ipp = opts.pagination.items or opts.items.visible
        max = Math.ceil(itms.total / ipp - 1)
        nr = undefined
        if itms.first is 0
          nr = 0
        else if itms.first < itms.total % ipp
          nr = 0
        else if itms.first is ipp and not opts.circular
          nr = max
        else
          nr = Math.round((itms.total - itms.first) / ipp)
        nr = 0  if nr < 0
        nr = max  if nr > max
        fn.call $tt0, nr  if is_function(fn)
        nr

      $cfs.bind cf_e("currentVisible", conf), (e, fn) ->
        e.stopPropagation()
        $i = gi_getCurrentItems($cfs.children(), opts)
        fn.call $tt0, $i  if is_function(fn)
        $i

      $cfs.bind cf_e("slice", conf), (e, f, l, fn) ->
        e.stopPropagation()
        return false  if itms.total is 0
        v = [f, l, fn]
        t = ["number", "number", "function"]
        a = cf_sortParams(v, t)
        f = (if (is_number(a[0])) then a[0] else 0)
        l = (if (is_number(a[1])) then a[1] else itms.total)
        fn = a[2]
        f += itms.first
        l += itms.first
        if items.total > 0
          f -= itms.total  while f > itms.total
          l -= itms.total  while l > itms.total
          f += itms.total  while f < 0
          l += itms.total  while l < 0
        $iA = $cfs.children()
        $i = undefined
        if l > f
          $i = $iA.slice(f, l)
        else
          $i = $($iA.slice(f, itms.total).get().concat($iA.slice(0, l).get()))
        fn.call $tt0, $i  if is_function(fn)
        $i

      $cfs.bind cf_e("isPaused", conf) + " " + cf_e("isStopped", conf) + " " + cf_e("isScrolling", conf), (e, fn) ->
        e.stopPropagation()
        eType = e.type.slice(conf.events.prefix.length)
        value = crsl[eType]
        fn.call $tt0, value  if is_function(fn)
        value

      $cfs.bind cf_e("configuration", conf), (e, a, b, c) ->
        e.stopPropagation()
        reInit = false
        if is_function(a)
          a.call $tt0, opts
        else if is_object(a)
          opts_orig = $.extend(true, {}, opts_orig, a)
          if b isnt false
            reInit = true
          else
            opts = $.extend(true, {}, opts, a)
        else unless is_undefined(a)
          if is_function(b)
            val = eval_("opts." + a)
            val = ""  if is_undefined(val)
            b.call $tt0, val
          else unless is_undefined(b)
            c = true  if typeof c isnt "boolean"
            eval_ "opts_orig." + a + " = b"
            if c isnt false
              reInit = true
            else
              eval_ "opts." + a + " = b"
          else
            return eval_("opts." + a)
        if reInit
          sz_resetMargin $cfs.children(), opts
          FN._init opts_orig
          FN._bind_buttons()
          sz = sz_setSizes($cfs, opts)
          $cfs.trigger cf_e("updatePageStatus", conf), [true, sz]
        opts

      $cfs.bind cf_e("linkAnchors", conf), (e, $con, sel) ->
        e.stopPropagation()
        if is_undefined($con)
          $con = $("body")
        else $con = $($con)  if is_string($con)
        return debug(conf, "Not a valid object.")  if not is_jquery($con) or $con.length is 0
        sel = "a.caroufredsel"  unless is_string(sel)
        $con.find(sel).each ->
          h = @hash or ""
          if h.length > 0 and $cfs.children().index($(h)) isnt -1
            $(this).unbind("click").click (e) ->
              e.preventDefault()
              $cfs.trigger cf_e("slideTo", conf), h


        true

      $cfs.bind cf_e("updatePageStatus", conf), (e, build, sizes) ->
        e.stopPropagation()
        return  unless opts.pagination.container
        ipp = opts.pagination.items or opts.items.visible
        pgs = Math.ceil(itms.total / ipp)
        if build
          if opts.pagination.anchorBuilder
            opts.pagination.container.children().remove()
            opts.pagination.container.each ->
              a = 0

              while a < pgs
                i = $cfs.children().eq(gn_getItemIndex(a * ipp, 0, true, itms, $cfs))
                $(this).append opts.pagination.anchorBuilder.call(i[0], a + 1)
                a++

          opts.pagination.container.each ->
            $(this).children().unbind(opts.pagination.event).each (a) ->
              $(this).bind opts.pagination.event, (e) ->
                e.preventDefault()
                $cfs.trigger cf_e("slideTo", conf), [a * ipp, -opts.pagination.deviation, true, opts.pagination]



        selected = $cfs.triggerHandler(cf_e("currentPage", conf)) + opts.pagination.deviation
        selected = 0  if selected >= pgs
        selected = pgs - 1  if selected < 0
        opts.pagination.container.each ->
          $(this).children().removeClass(cf_c("selected", conf)).eq(selected).addClass cf_c("selected", conf)

        true

      $cfs.bind cf_e("updateSizes", conf), (e) ->
        vI = opts.items.visible
        a_itm = $cfs.children()
        avail_primary = ms_getParentSize($wrp, opts, "width")
        itms.total = a_itm.length
        if crsl.primarySizePercentage
          opts.maxDimension = avail_primary
          opts[opts.d["width"]] = ms_getPercentage(avail_primary, crsl.primarySizePercentage)
        else
          opts.maxDimension = ms_getMaxDimension(opts, avail_primary)
        if opts.responsive
          opts.items.width = opts.items.sizesConf.width
          opts.items.height = opts.items.sizesConf.height
          opts = in_getResponsiveValues(opts, a_itm, avail_primary)
          vI = opts.items.visible
          sz_setResponsiveSizes opts, a_itm
        else if opts.items.visibleConf.variable
          vI = gn_getVisibleItemsNext(a_itm, opts, 0)
        else vI = gn_getVisibleItemsNextFilter(a_itm, opts, 0)  unless opts.items.filter is "*"
        if not opts.circular and itms.first isnt 0 and vI > itms.first
          if opts.items.visibleConf.variable
            nI = gn_getVisibleItemsPrev(a_itm, opts, itms.first) - itms.first
          else unless opts.items.filter is "*"
            nI = gn_getVisibleItemsPrevFilter(a_itm, opts, itms.first) - itms.first
          else
            nI = opts.items.visible - itms.first
          debug conf, "Preventing non-circular: sliding " + nI + " items backward."
          $cfs.trigger cf_e("prev", conf), nI
        opts.items.visible = cf_getItemsAdjust(vI, opts, opts.items.visibleConf.adjust, $tt0)
        opts.items.visibleConf.old = opts.items.visible
        opts = in_getAlignPadding(opts, a_itm)
        sz = sz_setSizes($cfs, opts)
        $cfs.trigger cf_e("updatePageStatus", conf), [true, sz]
        nv_showNavi opts, itms.total, conf
        nv_enableNavi opts, itms.first, conf
        sz

      $cfs.bind cf_e("destroy", conf), (e, orgOrder) ->
        e.stopPropagation()
        tmrs = sc_clearTimers(tmrs)
        $cfs.data "_cfs_isCarousel", false
        $cfs.trigger cf_e("finish", conf)
        $cfs.trigger cf_e("jumpToStart", conf)  if orgOrder
        sz_restoreOrigCss $cfs.children()
        sz_restoreOrigCss $cfs
        FN._unbind_events()
        FN._unbind_buttons()
        if conf.wrapper is "parent"
          sz_restoreOrigCss $wrp
        else
          $wrp.replaceWith $cfs
        true

      $cfs.bind cf_e("debug", conf), (e) ->
        debug conf, "Carousel width: " + opts.width
        debug conf, "Carousel height: " + opts.height
        debug conf, "Item widths: " + opts.items.width
        debug conf, "Item heights: " + opts.items.height
        debug conf, "Number of items visible: " + opts.items.visible
        debug conf, "Number of items scrolled automatically: " + opts.auto.items  if opts.auto.play
        debug conf, "Number of items scrolled backward: " + opts.prev.items  if opts.prev.button
        debug conf, "Number of items scrolled forward: " + opts.next.items  if opts.next.button
        conf.debug

      $cfs.bind "_cfs_triggerEvent", (e, n, o) ->
        e.stopPropagation()
        $cfs.triggerHandler cf_e(n, conf), o


    FN._unbind_events = ->
      $cfs.unbind cf_e("", conf)
      $cfs.unbind cf_e("", conf, false)
      $cfs.unbind "_cfs_triggerEvent"

    FN._bind_buttons = ->
      FN._unbind_buttons()
      nv_showNavi opts, itms.total, conf
      nv_enableNavi opts, itms.first, conf
      if opts.auto.pauseOnHover
        pC = bt_pauseOnHoverConfig(opts.auto.pauseOnHover)
        $wrp.bind(cf_e("mouseenter", conf, false), ->
          $cfs.trigger cf_e("pause", conf), pC
        ).bind cf_e("mouseleave", conf, false), ->
          $cfs.trigger cf_e("resume", conf)

      if opts.auto.button
        opts.auto.button.bind cf_e(opts.auto.event, conf, false), (e) ->
          e.preventDefault()
          ev = false
          pC = null
          if crsl.isPaused
            ev = "play"
          else if opts.auto.pauseOnEvent
            ev = "pause"
            pC = bt_pauseOnHoverConfig(opts.auto.pauseOnEvent)
          $cfs.trigger cf_e(ev, conf), pC  if ev

      if opts.prev.button
        opts.prev.button.bind cf_e(opts.prev.event, conf, false), (e) ->
          e.preventDefault()
          $cfs.trigger cf_e("prev", conf)

        if opts.prev.pauseOnHover
          pC = bt_pauseOnHoverConfig(opts.prev.pauseOnHover)
          opts.prev.button.bind(cf_e("mouseenter", conf, false), ->
            $cfs.trigger cf_e("pause", conf), pC
          ).bind cf_e("mouseleave", conf, false), ->
            $cfs.trigger cf_e("resume", conf)

      if opts.next.button
        opts.next.button.bind cf_e(opts.next.event, conf, false), (e) ->
          e.preventDefault()
          $cfs.trigger cf_e("next", conf)

        if opts.next.pauseOnHover
          pC = bt_pauseOnHoverConfig(opts.next.pauseOnHover)
          opts.next.button.bind(cf_e("mouseenter", conf, false), ->
            $cfs.trigger cf_e("pause", conf), pC
          ).bind cf_e("mouseleave", conf, false), ->
            $cfs.trigger cf_e("resume", conf)

      if opts.pagination.container
        if opts.pagination.pauseOnHover
          pC = bt_pauseOnHoverConfig(opts.pagination.pauseOnHover)
          opts.pagination.container.bind(cf_e("mouseenter", conf, false), ->
            $cfs.trigger cf_e("pause", conf), pC
          ).bind cf_e("mouseleave", conf, false), ->
            $cfs.trigger cf_e("resume", conf)

      if opts.prev.key or opts.next.key
        $(document).bind cf_e("keyup", conf, false, true, true), (e) ->
          k = e.keyCode
          if k is opts.next.key
            e.preventDefault()
            $cfs.trigger cf_e("next", conf)
          if k is opts.prev.key
            e.preventDefault()
            $cfs.trigger cf_e("prev", conf)

      if opts.pagination.keys
        $(document).bind cf_e("keyup", conf, false, true, true), (e) ->
          k = e.keyCode
          if k >= 49 and k < 58
            k = (k - 49) * opts.items.visible
            if k <= itms.total
              e.preventDefault()
              $cfs.trigger cf_e("slideTo", conf), [k, 0, true, opts.pagination]

      if $.fn.swipe
        isTouch = "ontouchstart" of window
        if (isTouch and opts.swipe.onTouch) or (not isTouch and opts.swipe.onMouse)
          scP = $.extend(true, {}, opts.prev, opts.swipe)
          scN = $.extend(true, {}, opts.next, opts.swipe)
          swP = ->
            $cfs.trigger cf_e("prev", conf), [scP]

          swN = ->
            $cfs.trigger cf_e("next", conf), [scN]

          switch opts.direction
            when "up", "down"
              opts.swipe.options.swipeUp = swN
              opts.swipe.options.swipeDown = swP
            else
              opts.swipe.options.swipeLeft = swN
              opts.swipe.options.swipeRight = swP
          $cfs.swipe "destroy"  if crsl.swipe
          $wrp.swipe opts.swipe.options
          $wrp.css "cursor", "move"
          crsl.swipe = true
      if $.fn.mousewheel
        if opts.mousewheel
          mcP = $.extend(true, {}, opts.prev, opts.mousewheel)
          mcN = $.extend(true, {}, opts.next, opts.mousewheel)
          $wrp.unbind cf_e("mousewheel", conf, false)  if crsl.mousewheel
          $wrp.bind cf_e("mousewheel", conf, false), (e, delta) ->
            e.preventDefault()
            if delta > 0
              $cfs.trigger cf_e("prev", conf), [mcP]
            else
              $cfs.trigger cf_e("next", conf), [mcN]

          crsl.mousewheel = true
      $cfs.trigger cf_e("play", conf), opts.auto.delay  if opts.auto.play
      if crsl.upDateOnWindowResize
        resizeFn = (e) ->
          $cfs.trigger cf_e("finish", conf)
          $cfs.trigger cf_e("play", conf)  if opts.auto.pauseOnResize and not crsl.isPaused
          sz_resetMargin $cfs.children(), opts
          $cfs.trigger cf_e("updateSizes", conf)

        $w = $(window)
        onResize = null
        if $.debounce and conf.onWindowResize is "debounce"
          onResize = $.debounce(200, resizeFn)
        else if $.throttle and conf.onWindowResize is "throttle"
          onResize = $.throttle(300, resizeFn)
        else
          _windowWidth = 0
          _windowHeight = 0
          onResize = ->
            nw = $w.width()
            nh = $w.height()
            if nw isnt _windowWidth or nh isnt _windowHeight
              resizeFn()
              _windowWidth = nw
              _windowHeight = nh
        $w.bind cf_e("resize", conf, false, true, true), onResize

    FN._unbind_buttons = ->
      ns1 = cf_e("", conf)
      ns2 = cf_e("", conf, false)
      ns3 = cf_e("", conf, false, true, true)
      $(document).unbind ns3
      $(window).unbind ns3
      $wrp.unbind ns2
      opts.auto.button.unbind ns2  if opts.auto.button
      opts.prev.button.unbind ns2  if opts.prev.button
      opts.next.button.unbind ns2  if opts.next.button
      if opts.pagination.container
        opts.pagination.container.unbind ns2
        opts.pagination.container.children().remove()  if opts.pagination.anchorBuilder
      if crsl.swipe
        $cfs.swipe "destroy"
        $wrp.css "cursor", "default"
        crsl.swipe = false
      crsl.mousewheel = false  if crsl.mousewheel
      nv_showNavi opts, "hide", conf
      nv_enableNavi opts, "removeClass", conf

    configs = debug: configs  if is_boolean(configs)
    crsl =
      direction: "next"
      isPaused: true
      isScrolling: false
      isStopped: false
      mousewheel: false
      swipe: false

    itms =
      total: $cfs.children().length
      first: 0

    tmrs =
      auto: null
      progress: null
      startTime: getTime()
      timePassed: 0

    scrl =
      isStopped: false
      duration: 0
      startTime: 0
      easing: ""
      anims: []

    clbk =
      onBefore: []
      onAfter: []

    queu = []
    conf = $.extend(true, {}, $.fn.carouFredSel.configs, configs)
    opts = {}
    opts_orig = $.extend(true, {}, options)
    $wrp = (if (conf.wrapper is "parent") then $cfs.parent() else $cfs.wrap("<" + conf.wrapper.element + " class=\"" + conf.wrapper.classname + "\" />").parent())
    conf.selector = $cfs.selector
    conf.serialNumber = $.fn.carouFredSel.serialNumber++
    conf.transition = (if (conf.transition and $.fn.transition) then "transition" else "animate")
    FN._init opts_orig, true, starting_position
    FN._build()
    FN._bind_events()
    FN._bind_buttons()
    if is_array(opts.items.start)
      start_arr = opts.items.start
    else
      start_arr = []
      start_arr.push opts.items.start  unless opts.items.start is 0
    start_arr.unshift parseInt(cf_getCookie(opts.cookie), 10)  if opts.cookie
    if start_arr.length > 0
      a = 0
      l = start_arr.length

      while a < l
        s = start_arr[a]
        continue  if s is 0
        if s is true
          s = window.location.hash
          continue  if s.length < 1
        else s = Math.floor(Math.random() * itms.total)  if s is "random"
        break  if $cfs.triggerHandler(cf_e("slideTo", conf), [s, 0, true,
          fx: "none"
        ])
        a++
    siz = sz_setSizes($cfs, opts)
    itm = gi_getCurrentItems($cfs.children(), opts)
    if opts.onCreate
      opts.onCreate.call $tt0,
        width: siz.width
        height: siz.height
        items: itm

    $cfs.trigger cf_e("updatePageStatus", conf), [true, siz]
    $cfs.trigger cf_e("linkAnchors", conf)
    $cfs.trigger cf_e("debug", conf)  if conf.debug
    $cfs

  $.fn.carouFredSel.serialNumber = 1
  $.fn.carouFredSel.defaults =
    synchronise: false
    infinite: true
    circular: true
    responsive: false
    direction: "left"
    items:
      start: 0

    scroll:
      easing: "swing"
      duration: 500
      pauseOnHover: false
      event: "click"
      queue: false

  $.fn.carouFredSel.configs =
    debug: false
    transition: false
    onWindowResize: "throttle"
    events:
      prefix: ""
      namespace: "cfs"

    wrapper:
      element: "div"
      classname: "caroufredsel_wrapper"

    classnames: {}

  $.fn.carouFredSel.pageAnchorBuilder = (nr) ->
    "<a href=\"#\"><span>" + nr + "</span></a>"

  $.fn.carouFredSel.progressbarUpdater = (perc) ->
    $(this).css "width", perc + "%"

  $.fn.carouFredSel.cookie =
    get: (n) ->
      n += "="
      ca = document.cookie.split(";")
      a = 0
      l = ca.length

      while a < l
        c = ca[a]
        c = c.slice(1)  while c.charAt(0) is " "
        return c.slice(n.length)  if c.indexOf(n) is 0
        a++
      0

    set: (n, v, d) ->
      e = ""
      if d
        date = new Date()
        date.setTime date.getTime() + (d * 24 * 60 * 60 * 1000)
        e = "; expires=" + date.toGMTString()
      document.cookie = n + "=" + v + e + "; path=/"

    remove: (n) ->
      $.fn.carouFredSel.cookie.set n, "", -1

  
  #	EASING FUNCTIONS
  $.extend $.easing,
    quadratic: (t) ->
      t2 = t * t
      t * (-t2 * t + 4 * t2 - 6 * t + 4)

    cubic: (t) ->
      t * (4 * t * t - 9 * t + 6)

    elastic: (t) ->
      t2 = t * t
      t * (33 * t2 * t2 - 106 * t2 * t + 126 * t2 - 67 * t + 15)

) jQuery