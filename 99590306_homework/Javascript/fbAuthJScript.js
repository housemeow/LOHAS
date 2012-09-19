function FacebookInit() {
    FB.init({
        appId: '278562308859240',
        status: true,
        cookie: true,
        oauth: true,
        xfbml: true
    });
}
function FacebookLogin() {
    FacebookInit();
    FB.login(function (response) {
        if (response.authResponse) {
            FB.api('/me', function (response) {
                var fbID = response.id;
                var fbName = response.name;
                var fbEmail = response.email;
                location.href = 'fbTripMenu.aspx?fbID=' + fbID + '&fbName=' + fbName + '&fbEmail=' + fbEmail;
            });
        }
    }, { scope: 'email' });
}

function FacebookLogout() {
    FacebookInit();
    FB.getLoginStatus(statusResponse);
}

function statusResponse(response) {
    FB.logout(response.authResponse.accessToken);
} 



