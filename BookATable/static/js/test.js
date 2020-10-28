
var updateBtns=document.getElementsByClassName('update-cart');

    for(var i=0;i<updateBtns.length;i++){
        updateBtns[i].addEventListener('click',function(){
            var menuID=this.dataset.menu;
            var action=this.dataset.action;
            
            var user=this.dataset.user
            console.log('USER:', user)
            if(user === 'AnonymousUser' || user === 'None' ){
                console.log("Not Loged In")
            }else{
                console.log('Menu Id',menuID,'user',user,'action',action)
                updateUserOrder(menuID,user,action)
            }
        });
    }

function updateUserOrder(menuID,user,action){
    console.log('User Is logged in')
    var url = '/update_item/'
    fetch(url,{
        method:'POST',
        headers:{
            'Content-Type':'application/json',
            'X-CSRFToken':csrftoken,
        },
        body:JSON.stringify({'menuID':menuID,'user':user,'action':action})
        
    })
    .then((response)=>{
        return response.json()
    })
    .then((data) =>{
        console.log('data:',data)
        location.reload()
    })
    var container = document.getElementById('selectedmenu');
    container.style.height = (container.offsetHeight + 30) + "px";        
      
}
