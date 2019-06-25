var exec = require('cordova/exec');
var fbShare ={

coolMethod:(arg0, success, error) => {
    exec(success, error, 'FBSharing', 'coolMethod', [arg0]);
},

fbIOSSharing:(imageUrl) =>{
    exec(null,null, 'FBSharing', 'fbShareIOS',[imageUrl]);
},

}

module.exports = fbShare