package package_116
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_926 implements IMessageComposer
   {
       
      
      private var _voteOption:int;
      
      public function class_926(param1:int)
      {
         super();
         this._voteOption = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [_voteOption];
      }
   }
}
