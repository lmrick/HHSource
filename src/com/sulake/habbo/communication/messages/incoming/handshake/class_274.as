package package_6
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import package_133.class_1170;
   
   public class class_274 extends MessageEvent implements IMessageEvent
   {
      
      public static const const_165:int = -1;
      
      public static const const_54:int = -2;
      
      public static const const_268:int = -3;
      
      public static const const_12:int = 0;
      
      public static const const_339:int = 1;
      
      public static const const_174:int = 2;
      
      public static const const_265:int = 3;
      
      public static const const_115:int = 4;
      
      public static const const_239:int = 5;
      
      public static const const_76:int = 10;
      
      public static const const_195:int = 11;
      
      public static const const_351:int = 12;
      
      public static const const_99:int = 13;
      
      public static const const_43:int = 16;
      
      public static const const_67:int = 17;
      
      public static const const_384:int = 18;
      
      public static const const_170:int = 19;
      
      public static const const_383:int = 20;
      
      public static const const_181:int = 22;
      
      public static const const_330:int = 23;
      
      public static const const_341:int = 24;
      
      public static const const_389:int = 25;
      
      public static const const_26:int = 26;
      
      public static const const_50:int = 27;
      
      public static const const_333:int = 28;
      
      public static const const_88:int = 29;
      
      public static const const_39:int = 100;
      
      public static const const_225:int = 101;
      
      public static const const_337:int = 102;
      
      public static const const_313:int = 103;
      
      public static const const_82:int = 104;
      
      public static const const_348:int = 105;
      
      public static const const_297:int = 106;
      
      public static const const_36:int = 107;
      
      public static const const_19:int = 108;
      
      public static const const_285:int = 109;
      
      public static const const_294:int = 110;
      
      public static const const_94:int = 111;
      
      public static const const_368:int = 112;
      
      public static const const_85:int = 113;
      
      public static const const_342:int = 114;
      
      public static const const_147:int = 115;
      
      public static const const_356:int = 116;
      
      public static const SOCKET_WRITE_EXCEPTION_1:int = 117;
      
      public static const SOCKET_WRITE_EXCEPTION_2:int = 118;
      
      public static const SOCKET_WRITE_EXCEPTION_3:int = 119;
      
      public static const const_131:int = 120;
      
      public static const const_296:int = 121;
      
      public static const const_171:int = 122;
      
      public static const const_102:int = 123;
      
      public static const const_152:int = 124;
      
      public static const const_223:int = 125;
      
      public static const const_51:int = 126;
      
      private static var var_567:Dictionary;
       
      
      public function class_274(param1:Function)
      {
         super(param1,class_1170);
      }
      
      public static function resolveDisconnectedReasonLocalizationKey(param1:int) : String
      {
         switch(param1)
         {
            case -2:
               return "${disconnected.maintenance}";
            case 0:
               return "${disconnected.logged_out}";
            case 1:
               return "${disconnected.just_banned}";
            case 10:
               return "${disconnected.still_banned}";
            case 2:
            case 13:
            case 11:
            case 18:
               return "${disconnected.concurrent_login}";
            case 12:
            case 19:
               return "${disconnected.hotel_closed}";
            case 20:
               return "${disconnected.incorrect_password}";
            case 112:
               return "${disconnected.idle}";
            case 122:
               return "${disconnected.incompatible_client_version}";
            case 4:
            case 5:
            case 16:
            case 17:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 100:
            case 101:
            case 102:
            case 103:
            case 104:
            case 105:
            case 106:
            case 107:
            case 108:
            case 109:
            case 110:
            case 111:
            case 113:
            case 114:
            case 115:
            case 116:
            case 117:
            case 118:
            case 119:
            case 120:
            case 121:
            case 123:
            case 124:
            case 125:
            case 126:
               break;
            default:
               return "${disconnected.generic}";
         }
         return "${disconnected.generic}";
      }
      
      public function get reason() : int
      {
         return (this.var_15 as class_1170).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case 1:
            case 10:
               break;
            case 2:
               return "concurrentlogin";
            case 20:
               return "incorrectpassword";
            default:
               return "logout";
         }
         return "banned";
      }
      
      public function getReasonName() : String
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(var_567 == null)
         {
            var_567 = new Dictionary();
            _loc2_ = describeType(class_274);
            for each(var _loc1_ in _loc2_.constant)
            {
               _loc3_ = _loc1_.@name;
               _loc4_ = "null";
               var_567[_loc4_] = _loc3_;
            }
         }
         return var_567[reason];
      }
   }
}
