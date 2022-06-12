
function checkKey() {
    $.ajax({
        url: '/admin/redis-check-key',
        type: 'GET',
        contentType: "application/json"
    }).done(function (data) {
        if(data){
            loadUser();
        }else {
            setUser();
        }
    });
}

function setUser() {
    $.ajax({
        url: '/admin/redis/setUesr',
        type: 'POST',
        contentType: "application/json"
    }).done(function (data) {
        if (data == true) {
            loadUser();
        }
    });
}

function loadUser() {
    $.ajax({
        url: '/admin/redis/getUser',
        type: 'GET',
    }).done(function (data) {
        $('#user-name').text(data.name);
        $('#user-role').text(data.email);
    });
}