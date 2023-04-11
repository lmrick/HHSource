package package_78
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1624 implements class_1623
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var _selected:Boolean;
      
      public function class_1624(param1:IMessageDataWrapper)
      {
         super();
         this.var_339 = param1.readInteger();
         this._userName = param1.readString();
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         _selected = param1;
      }
   }
}
