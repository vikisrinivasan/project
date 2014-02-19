App = Ember.Application.create();
 
 data={};
var counter=0;
var jsonarray;
var length;
  /**var UserName, MailId, Phno,Password,conpass;**/
App.Router.map(function() {
   this.resource("login");
                  this.resource("phareg");
                   this.resource("usrreg");
                 
});
App.IndexRoute=Ember.Route.extend({
  
  model:function()
  {
    return Intro;
  }
  });
App.Log=Ember.Object.extend({
  usr:false,
  password:false
 });
 App.LoginRoute=Ember.Route.extend({
  
  model :function()
  {
      return loginattr;
  },
   setupController : function(controller, model){
        controller.set("model", model);
    } ,
}); 
App.LoginController = Ember.ObjectController.extend({
    submitAction : function(){
       
        // here you could perform your actions like persisting to the server or so
      var i=0;
      var username=this.get('model.usr');
       var password=this.get('model.password');
      jsonarray=JSON.stringify(data);
      var jsondata=JSON.parse(jsonarray);
      while(i<=counter)
      {
        if (jsondata.counter.UserName==username) {
            alert(jsondata.counter.Passwd);
        }
        i++;
     }
     
      }
});
     
    
      App.UserView=Ember.View.extend({
        correct:false,
        produce:false,
         focusOut: function(event) {
          
      var UserName=this.get('controller.usr');
      
       var regex=/^[a-zA-Z]+$/;
       if (regex.test(UserName)) {
        this.set('correct',true)
        this.set('produce',false)
       }
       else
       {
         this.set('correct',false)
         this.set('produce',true)
       }
  },
 
});
   
      App.PasswordView=Ember.View.extend({
        correct:false,
         produce:false,
         keyUp: function(event) {
      
      var password=this.get('controller.password');
       var regex=/^(?=^.{6,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$/;
       if (regex.test(password)) {
        this.set('correct',true);
        this.set('produce',false)
       }
      else
       {
         this.set('correct',false)
         this.set('produce',true)
       }
  }
});
 
 
   App.UserregView = Ember.View.extend({
   submit:function(event)
  {
  UserName=this.get('controller.UserName');
  MailId=this.get('controller.MailId');
  Phno=this.get('controller.PhoneNumber');
   Password=this.get('controller.Password');
   conpass=this.get('controller.ConfirmPassword');
data ={counter:{
  
  UserName:UserName,
  mailid:MailId,
  Phone:Phno,
  Passwd:Password
}
}
counter++;
  this.set('controller.UserName',"");
  this.set('controller.MailId',"");
  this.set('controller.PhoneNumber',"");
  this.set('controller.Password',"");
  this.set('controller.ConfirmPassword',"");
  }
   }); 
   App.UsernameView=Ember.View.extend({
        correct:false,
        produce:false,
         focusOut: function(event) {
      var UserName=this.get('controller.UserName');
       var regex=/^[a-zA-Z]+$/;
       if (regex.test(UserName)) {
        this.set('correct',true)
             this.set('produce',false)
       }
       else
       {
         this.set('correct', false)
           this.set('produce',true)
       }
  }
});
   
      App.PasswdView=Ember.View.extend({
        correct:false,
         produce:false,
         focusOut: function(event) {
      
      var password=this.get('controller.Password');
       var ConfirmPassword=this.get('controller.ConfirmPassword');
       var regex=/^(?=^.{6,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$/;
       if (regex.test(password)) {
        this.set('correct',true);
             this.set('produce',false)
       }
       else
       {
        this.set('correct', false);
             this.set('produce',true)
       }
  }
});
      
      App.ConfirmpasswdView=Ember.View.extend({
        correct:false,
         produce:false,
         focusOut: function(event) {
      
      var password=this.get('controller.Password');
     
       var ConfirmPassword=this.get('controller.ConfirmPassword');
        if (password==ConfirmPassword) {
        this.set('correct',true);
             this.set('produce',false)
       }
       else
       {
        this.set('correct',false);
             this.set('produce',true)
       }
  }
});
 App.MailView=Ember.View.extend({
        correct:false,
   
         focusOut: function(event) {
      
      var MailId=this.get('controller.MailId');
       var regex= /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
       if (regex.test(MailId)) {
        
        this.set('correct',true);
          
       }
       else
       {
        this.set('correct',false);
             
       }
  }
});
  App.PhnoView=Ember.View.extend({
        correct:false,
         produce:false,
         focusOut: function(event) {
      var phnumber=this.get('controller.PhoneNumber');
       var regex=/^[0-9]\d{2}\d{3}\d{4}$/;
       if (regex.test(phnumber)) {
        this.set('correct',true);
             this.set('produce',false)
       }
       else
       {
        this.set('correct',false);
             this.set('produce',true)
       }
  }
});
    
 
 var Intro={
   para:"Search for medicines by entering what you are looking for",
   para1:"No need to wade through multiple Pharmacy Stores to find what you want",
   newslk:" Stay updated with Latest Health News",
   locatepr:"See How You Can Locate Your Medicines"
 }
 var loginattr={
   phsgup:"Pharmacy Signup",
  usrsgup:"User Signup",
  fgpass:"Forgot Password ?",
  sgin:"Sign-in"
  
 }

 var phregattr=
 {
  reg:"Register",
  phrg:"Pharmacy Registration"
 }
  
 
 
 
 
 
 
 
 
 
