document.querySelector(".btn-decr").setAttribute("disabled", "disabled");

    //
    var valueCount
    

    //plus
    document.querySelector(".btn-incr").addEventListener("click", function()
    {
      //getting value of input
      var idStr= this.id.toString();
      valueCount = document.getElementById("quan{{forloop.counter}}").value;
      var i = this.attr('start');
      i++
      //input increment
      valueCount=i

      //setting increment value
      document.getElementById("quan").value = i;
      
      if(valueCount > 1)
      {
        document.querySelector(".btn-decr").removeAttribute("disabled")
        document.querySelector(".btn-decr").classList.remove("disabled")
      }
    })

    //minus
    document.querySelector(".btn-decr").addEventListener("click", function()
    {
      //getting value of input
      valueCount = document.getElementById("quan").value;
      //input increment
      valueCount--;

      //setting increment value
      document.getElementById("quan").value = valueCount
      
      if(valueCount == 1)
      {
        document.querySelector(".btn-decr").setAttribute("disabled", "disabled")
      }
    })