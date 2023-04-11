package package_184
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class NewMoveTargetEventData extends SnowWarGameEventData
   {
       
      
      private var var_756:int;
      
      private var var_29:int;
      
      private var var_28:int;
      
      public function NewMoveTargetEventData(param1:int)
      {
         super(param1);
      }
      
      public function get humanGameObjectId() : int
      {
         return var_756;
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      override public function parse(param1:IMessageDataWrapper) : void
      {
         var_756 = param1.readInteger();
         var_29 = param1.readInteger();
         var_28 = param1.readInteger();
      }
   }
}
