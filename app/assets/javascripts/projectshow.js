function toggle_3(event) {
    if (event) {
      event.preventDefault();
    }
    let popup = document.getElementById("popup");
    popup.classList.toggle("active");
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
    let body = document.getElementById("body");
    body.classList.add("stop-scrolling");
  }
  
      function toggle_2(){
  
    let popup = document.getElementById("popup");
    popup.classList.toggle("active");
    let blur = document.getElementById("blur");
    blur.classList.toggle("active");
    let body_2 = document.getElementById("body")
    body_2.classList.remove("stop-scrolling");
    }

