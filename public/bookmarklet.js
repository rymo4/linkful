javascript: (function () {
    function f(a, b) {
        if (b == "js") {
            var c = document.createElement("script");
            c.setAttribute("type", "text/javascript");
            c.setAttribute("src", a)
        } else if (b == "css") {
            var c = document.createElement("link");
            c.setAttribute("rel", "stylesheet");
            c.setAttribute("type", "text/css");
            c.setAttribute("href", a)
        }
        if (typeof c != "undefined") document.getElementsByTagName("head")[0].appendChild(c)
    }
    function e(a, b) {
        var c = document.getElementsByTagName("head")[0];
        if (c) {
            var d = document.createElement("script");
            d.setAttribute("src", a);
            d.setAttribute("type", "text/javascript");
            var e = function () {
                if (this.readyState == "complete" || this.readyState == "loaded") {
                    b()
                }
            };
            d.onreadystatechange = e;
            d.onload = b;
            c.appendChild(d)
        }
    }
    function d() {
        e("http://fancyapps.com/fancybox/source/jquery.fancybox.pack.js?v=2.0.5", c)
    }
    function c() {
        f("http://linkful.herokuapp.com/bookmarklet/" + a, "js")
    }
    function b() {
        var a = document,
            b = a.createElement("scr" + "ipt"),
            c = a.body;
        try {
            if (!c) throw 0;
            a.title = " " + a.title;
            e("http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js", d)
        } catch (f) {
            alert("Please wait until the page has loaded.")
        }
    }
    var a = "4f6f2cd8540b090001000004";
    b();
    void 0
})()