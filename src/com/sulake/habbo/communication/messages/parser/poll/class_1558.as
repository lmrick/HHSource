package package_158
{
   [SecureSWF(rename="true")]
   public class class_1558
   {
      
      public static const const_232:int = 0;
      
      public static const const_182:int = 1;
      
      public static const const_289:int = 2;
      
      public static const const_398:int = 3;
       
      
      private var var_327:int;
      
      private var var_1336:int;
      
      private var var_1157:int;
      
      private var var_743:int;
      
      private var var_981:String;
      
      private var var_1138:int;
      
      private var var_744:int;
      
      private var _children:Vector.<package_158.class_1558>;
      
      private var var_554:Vector.<package_158.class_1579>;
      
      public function class_1558()
      {
         super();
         _children = new Vector.<package_158.class_1558>();
         var_554 = new Vector.<package_158.class_1579>();
      }
      
      public function get questionId() : int
      {
         return var_327;
      }
      
      public function set questionId(param1:int) : void
      {
         var_327 = param1;
      }
      
      public function get questionType() : int
      {
         return var_1336;
      }
      
      public function set questionType(param1:int) : void
      {
         var_1336 = param1;
      }
      
      public function get sortOrder() : int
      {
         return var_1157;
      }
      
      public function set sortOrder(param1:int) : void
      {
         var_1157 = param1;
      }
      
      public function get questionText() : String
      {
         return var_981;
      }
      
      public function set questionText(param1:String) : void
      {
         var_981 = param1;
      }
      
      public function get questionCategory() : int
      {
         return var_743;
      }
      
      public function set questionCategory(param1:int) : void
      {
         var_743 = param1;
      }
      
      public function get questionAnswerType() : int
      {
         return var_1138;
      }
      
      public function set questionAnswerType(param1:int) : void
      {
         var_1138 = param1;
      }
      
      public function get questionAnswerCount() : int
      {
         return var_744;
      }
      
      public function set questionAnswerCount(param1:int) : void
      {
         var_744 = param1;
      }
      
      public function get children() : Vector.<package_158.class_1558>
      {
         return _children;
      }
      
      public function set children(param1:Vector.<package_158.class_1558>) : void
      {
         _children = param1;
      }
      
      public function get questionChoices() : Vector.<package_158.class_1579>
      {
         return var_554;
      }
      
      public function set questionChoices(param1:Vector.<package_158.class_1579>) : void
      {
         var_554 = param1;
      }
   }
}
