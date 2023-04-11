package login
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.Timer;
   import onBoardingHcUi.Button;
   import onBoardingHcUi.ColouredButton;
   import onBoardingHcUi.InputField;
   import onBoardingHcUi.LoaderUI;
   
   public class SsoTokenView extends Sprite
   {
       
      
      private var _context:login.LoginFlow;
      
      private var var_120:TextField;
      
      private var _saveButton:ColouredButton;
      
      private var _cancelButton:ColouredButton;
      
      private var _loginAreaWidth:int = 640;
      
      private var var_89:InputField;
      
      private var var_66:Boolean;
      
      public function SsoTokenView(param1:login.LoginFlow)
      {
         super();
         _context = param1;
         addEventListener("addedToStage",onAddedToStage);
         init();
      }
      
      public function dispose() : void
      {
         if(var_89)
         {
            var_89.removeEventListener("change",onInputChange);
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:Timer = new Timer(20,1);
         _loc2_.addEventListener("timerComplete",onAlignElements);
         _loc2_.start();
      }
      
      private function onAlignElements(param1:TimerEvent) : void
      {
         LoaderUI.alignAnchors(var_89,0,"r",_saveButton);
         LoaderUI.alignAnchors(_saveButton,-20,"l",_cancelButton);
         class_14.log("(login) Buttons: undefined");
      }
      
      public function init() : void
      {
         if(var_66)
         {
            return;
         }
         var_66 = true;
         addTitleField();
         addInputFields();
         addButtons();
      }
      
      private function addTitleField() : void
      {
         if(!var_120)
         {
            var_120 = LoaderUI.createTextField("${connection.login.title}",40,16777215,false,true,false,false,"left");
            var_120.x = 0;
            var_120.y = 0;
            var_120.width = 500;
            var_120.multiline = false;
            var_120.thickness = 50;
            addChild(var_120);
         }
      }
      
      private function addInputFields() : void
      {
         var_89 = new InputField(_context,_loginAreaWidth,"${connection.login.code.prompt}","","${connection.login.useTicket}","",true);
         addChild(var_89);
         var_89.addEventListener("change",onInputChange);
         var_89.addEventListener("keyDown",onInputKeyboardEvent);
         var_89.x = 0;
         var_89.y = 100;
      }
      
      private function onInputKeyboardEvent(param1:KeyboardEvent) : void
      {
         if(param1.charCode == 13)
         {
            if(_saveButton && false)
            {
               onLogin(null);
            }
         }
      }
      
      private function onInputChange(param1:Event) : void
      {
         var _loc2_:Vector.<String> = new Vector.<String>();
         if(validateToken(_loc2_))
         {
            _context.updateEnvironment(_loc2_[0],true);
            _saveButton.active = true;
         }
         else
         {
            _saveButton.active = false;
         }
      }
      
      public function addButtons() : void
      {
         _cancelButton = new ColouredButton("red","${generic.cancel}",new Rectangle(0,300,0,40),true,onCancel,14211288);
         addChild(_cancelButton);
         _saveButton = new ColouredButton("gfreen","${connection.login.play}",new Rectangle(0,300,0,40),true,onLogin,14211288);
         _saveButton.active = false;
         addChild(_saveButton);
      }
      
      private function onLogin(param1:Button) : void
      {
         var _loc2_:Vector.<String> = new Vector.<String>();
         if(validateToken(_loc2_))
         {
            _context.initLoginWithSsoToken(_loc2_[0],_loc2_[1] + "." + _loc2_[2]);
         }
         else
         {
            _saveButton.active = false;
         }
      }
      
      private function validateToken(param1:Vector.<String>) : Boolean
      {
         var _loc4_:String;
         if(!(_loc4_ = "null"))
         {
            return false;
         }
         if(_loc4_.length == 0)
         {
            return false;
         }
         var _loc3_:Array = _loc4_.split(".");
         if(_loc3_.length != 3)
         {
            return false;
         }
         var _loc2_:String = String(_loc3_[0]).replace("hh","");
         _loc2_ = _loc2_.replace("br","pt");
         _loc2_ = _loc2_.replace("us","en");
         param1.push(_loc2_);
         param1.push(_loc3_[1]);
         param1.push(_loc3_[2]);
         return true;
      }
      
      private function onCancel(param1:Button) : void
      {
         _context.showScreen(1);
      }
      
      public function ready() : void
      {
         if(_saveButton != false)
         {
            _saveButton.active = true;
         }
      }
   }
}
