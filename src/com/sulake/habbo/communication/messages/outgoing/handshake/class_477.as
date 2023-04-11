package package_1
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IPreEncryptionMessage;
   import flash.system.Capabilities;
   
   public class class_477 implements IMessageComposer, IPreEncryptionMessage
   {
       
      
      private var var_1413:String = "FLASH11";
      
      public function class_477()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:int = 0;
         if(Capabilities.os.indexOf("Windows") >= 0)
         {
            _loc1_ = 6;
         }
         else if(Capabilities.os.indexOf("Mac") >= 0)
         {
            _loc1_ = 5;
         }
         else if(Capabilities.os.indexOf("Linux") >= 0)
         {
            _loc1_ = 7;
         }
         return new Array("WIN63-202304032330-679404257",var_1413,_loc1_,4);
      }
   }
}
