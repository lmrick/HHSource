package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1120 implements IMessageParser
   {
       
      
      private var _talentTrack:package_149.class_1606;
      
      public function class_1120()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _talentTrack = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _talentTrack = new package_149.class_1606();
         _talentTrack.parse(param1);
         return true;
      }
      
      public function getTalentTrack() : package_149.class_1606
      {
         return _talentTrack;
      }
   }
}
