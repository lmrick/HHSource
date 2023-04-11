package com.sulake.habbo.help
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ISelectorListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.messages.parser.help.class_1163;
   import com.sulake.habbo.communication.messages.parser.help.class_1167;
   import com.sulake.habbo.window.utils.IModalDialog;
   import package_4.class_767;
   import package_4.class_911;
   import package_69.class_273;
   import package_69.class_982;
   
   public class HabboWayQuizController implements class_13
   {
      
      private static const HABBO_WAY_QUIZ_CODE:String = "HabboWay1";
      
      private static const SAFETY_QUIZ_CODE:String = "SafetyQuiz1";
      
      private static const PAGE_QUESTION:int = 1;
      
      private static const PAGE_SUCCESS:int = 2;
      
      private static const PAGE_FAILURE:int = 3;
      
      private static const PAGE_ANALYSIS:int = 4;
       
      
      private var _disposed:Boolean;
      
      private var _habboHelp:com.sulake.habbo.help.HabboHelp;
      
      private var var_1680:IModalDialog;
      
      private var _window:class_3151;
      
      private var var_3072:class_3151;
      
      private var var_1970:ISelectorListWindow;
      
      private var var_2570:ISelectableWindow;
      
      private var var_2053:IItemListWindow;
      
      private var var_2576:class_3127;
      
      private var var_509:String;
      
      private var var_263:Array;
      
      private var var_2873:Array;
      
      private var _answerOrders:Array;
      
      private var _questionIdsForWrongAnswers:Array;
      
      private var _currentQuestion:int;
      
      public function HabboWayQuizController(param1:com.sulake.habbo.help.HabboHelp)
      {
         super();
         _habboHelp = param1;
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_767(onQuizData));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_911(onQuizResults));
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_3072 = null;
            var_1970 = null;
            if(var_2570 != null)
            {
               var_2570.dispose();
               var_2570 = null;
            }
            var_2053 = null;
            if(var_2576 != null)
            {
               var_2576.dispose();
               var_2576 = null;
            }
            closeWindow();
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function showHabboWayQuiz() : void
      {
         _habboHelp.sendMessage(new class_982("HabboWay1"));
      }
      
      public function showSafetyQuiz() : void
      {
         _habboHelp.sendMessage(new class_982("SafetyQuiz1"));
      }
      
      private function onQuizData(param1:class_767) : void
      {
         var _loc2_:class_1163 = param1.getParser();
         _habboHelp.closeHabboWay();
         _habboHelp.closeSafetyBooklet();
         showWindow(_loc2_.quizCode,_loc2_.questionIds);
      }
      
      private function onQuizResults(param1:class_911) : void
      {
         var _loc2_:class_1167 = param1.getParser();
         _questionIdsForWrongAnswers = _loc2_.questionIdsForWrongAnswers;
         if(false)
         {
            showPage(2);
         }
         else
         {
            showPage(3);
         }
      }
      
      private function showWindow(param1:String, param2:Array) : void
      {
         closeWindow();
         var_1680 = _habboHelp.getModalXmlWindow("habbo_way_quiz");
         _window = class_3151(var_1680.rootWindow);
         _window.procedure = onWindowEvent;
         var_3072 = class_3151(_window.findChildByName("question_pane"));
         var_1970 = ISelectorListWindow(var_3072.findChildByName("answer_list"));
         var_2570 = var_1970.getSelectableAt(0);
         var_1970.removeSelectable(var_2570);
         var_2053 = IItemListWindow(_window.findChildByName("analysis_pane"));
         var_2576 = var_2053.getListItemAt(0);
         var_2053.removeListItems();
         var_2053.spacing = 4;
         var_509 = param1;
         var_263 = param2;
         var_2873 = new Array(questionCount);
         _answerOrders = new Array(questionCount);
         setCurrentQuestion(0);
         var _loc3_:class_3151 = class_3151(IItemListWindow(var_2576).getListItemByName("explanation_container"));
         switch(var_509)
         {
            case "HabboWay1":
               IStaticBitmapWrapperWindow(_window.findChildByName("question_illustration")).assetUri = "${image.library.url}habboway/quiz_question.png";
               IStaticBitmapWrapperWindow(_window.findChildByName("indicator_image")).assetUri = "help_habboway_dove_on";
               IStaticBitmapWrapperWindow(_window.findChildByName("success_illustration")).assetUri = "${image.library.url}habboway/quiz_success.png";
               IStaticBitmapWrapperWindow(_loc3_.findChildByName("explanation_illustration")).assetUri = "help_habboway_dove_quizz";
               break;
            case "SafetyQuiz1":
               IStaticBitmapWrapperWindow(_window.findChildByName("question_illustration")).assetUri = "${image.library.url}safetyquiz/question_illustration.png";
               IStaticBitmapWrapperWindow(_window.findChildByName("indicator_image")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
               IStaticBitmapWrapperWindow(_window.findChildByName("failure_illustration")).assetUri = "${image.library.url}safetyquiz/result_failure.png";
               IStaticBitmapWrapperWindow(_window.findChildByName("success_illustration")).assetUri = "${image.library.url}safetyquiz/result_success.png";
               IStaticBitmapWrapperWindow(_loc3_.findChildByName("explanation_illustration")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
         }
         showPage(1);
      }
      
      private function closeWindow() : void
      {
         _window = null;
         if(var_1680 != null)
         {
            var_1680.dispose();
            var_1680 = null;
         }
      }
      
      private function showPage(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc8_:IItemListWindow = null;
         var _loc6_:String = null;
         var _loc9_:String = null;
         _window.findChildByName("question_pane").visible = param1 == 1;
         _window.findChildByName("success_pane").visible = param1 == 2;
         _window.findChildByName("failure_pane").visible = param1 == 3;
         var_2053.visible = param1 == 4;
         _window.findChildByName("prev_next_buttons").visible = param1 == 1;
         _window.findChildByName("failure_buttons").visible = param1 == 3;
         _window.findChildByName("exit_button_container").visible = param1 == 2 || param1 == 4;
         var _loc3_:class_3127 = _window.findChildByName("top_indicator");
         var _loc7_:class_3127 = _window.findChildByName("indicator_image");
         switch(param1 - 1)
         {
            case 0:
               _window.caption = getFullLocalizationKey("question.title");
               _loc7_.visible = true;
               _loc3_.visible = true;
               _loc3_.caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("question.page"),"","current_page",1,"page_count",questionCount.toString());
               _loc3_.caption = getFullLocalizationKey("question.page");
               break;
            case 1:
               _window.caption = getFullLocalizationKey("success.title");
               _window.findChildByName("failure_advice").caption = getFullLocalizationKey("failure.advice");
               _window.findChildByName("success_results").caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("success.results"),"","question_count",questionCount.toString());
               _loc7_.visible = false;
               _loc3_.visible = false;
               _loc3_.caption = "";
               break;
            case 2:
               _loc5_ = 0 - 0;
               _window.caption = getFullLocalizationKey("failure.title");
               _window.findChildByName("failure_advice").caption = getFullLocalizationKey("failure.advice");
               _window.findChildByName("failure_results").caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("failure.results"),"","correct_count",_loc5_.toString(),"total_count",questionCount.toString());
               _loc7_.visible = false;
               _loc3_.visible = false;
               _loc3_.caption = "";
               break;
            case 3:
               _window.caption = getFullLocalizationKey("analysis.title");
               _loc7_.visible = true;
               _loc3_.visible = true;
               _loc3_.caption = getFullLocalizationKey("analysis.top");
               for each(var _loc4_ in _questionIdsForWrongAnswers)
               {
                  _loc2_ = 0;
                  _loc8_ = IItemListWindow(var_2576.clone());
                  _loc6_ = "${quiz." + var_509 + ".";
                  _loc9_ = "." + _loc4_ + "." + _loc2_ + "}";
                  _loc8_.getListItemByName("question").caption = _loc6_ + "question." + _loc4_ + "}";
                  class_3151(_loc8_.getListItemByName("answer_container")).findChildByName("answer").caption = _loc6_ + "answer" + _loc9_;
                  class_3151(_loc8_.getListItemByName("explanation_container")).findChildByName("explanation").caption = _loc6_ + "explanation" + _loc9_;
                  var_2053.addListItem(_loc8_);
               }
               IItemListWindow(var_2053.getListItemAt(-1)).getListItemByName("separator").dispose();
         }
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(_disposed || _window == null || param1.type != "WME_CLICK")
         {
            return;
         }
         if(param2 is ISelectableWindow)
         {
            var_2873[_currentQuestion] = int(param2.name);
            _window.findChildByName("next_dimmer").visible = false;
         }
         else
         {
            switch(param2.name)
            {
               case "header_button_close":
               case "exit_button":
                  closeWindow();
                  break;
               case "prev_button":
                  setCurrentQuestion(_currentQuestion - 1);
                  break;
               case "next_button":
                  setCurrentQuestion(_currentQuestion + 1);
                  break;
               case "review_button":
                  showPage(4);
            }
         }
      }
      
      private function setCurrentQuestion(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc10_:* = null;
         var _loc2_:int = 0;
         var _loc4_:String = null;
         var _loc6_:ISelectableWindow = null;
         var _loc7_:int = 0;
         var _loc5_:ISelectableWindow = null;
         var _loc9_:ISelectableWindow = null;
         if(param1 >= questionCount)
         {
            _habboHelp.sendMessage(new class_273(var_509,var_2873));
         }
         else if(param1 >= 0)
         {
            _currentQuestion = param1;
            _window.findChildByName("prev_dimmer").visible = param1 <= 0;
            _window.findChildByName("next_dimmer").visible = true;
            _window.findChildByName("top_indicator").caption = _habboHelp.localization.getLocalizationWithParams(getRawLocalizationKey("question.page"),"","current_page",String(param1 + 1),"page_count",questionCount.toString());
            while(false)
            {
               var_1970.removeSelectable(var_1970.getSelectableAt(0)).dispose();
            }
            _loc3_ = 0;
            _loc10_ = [];
            var_3072.findChildByName("question").caption = "${quiz." + var_509 + ".question." + _loc3_ + "}";
            _loc2_ = 0;
            while((_loc4_ = String(_habboHelp.localization.getLocalization("quiz." + var_509 + ".answer." + _loc3_ + "." + _loc2_,""))).length > 0)
            {
               (_loc6_ = ISelectableWindow(var_2570.clone())).caption = _loc4_;
               _loc6_.name = _loc2_.toString();
               _loc10_.push(_loc6_);
               _loc2_++;
            }
            if(true)
            {
               _answerOrders[_currentQuestion] = [];
               _loc7_ = 0;
               while(_loc7_ < _loc2_)
               {
                  _loc5_ = _loc10_.splice(int(Math.random() * _loc10_.length),1)[0];
                  var_1970.addSelectable(_loc5_);
                  _answerOrders[_currentQuestion].push(int(_loc5_.name));
                  _loc7_++;
               }
            }
            else
            {
               for each(var _loc8_ in _answerOrders[_currentQuestion])
               {
                  var_1970.addSelectable(_loc10_[_loc8_]);
               }
            }
            if((_loc9_ = var_1970.getSelectableByName("null")) != null)
            {
               _loc9_.select();
            }
         }
      }
      
      private function get questionCount() : int
      {
         return var_263 != null ? var_263.length : 0;
      }
      
      private function getFullLocalizationKey(param1:String) : String
      {
         return "${" + getRawLocalizationKey(param1) + "}";
      }
      
      private function getRawLocalizationKey(param1:String) : String
      {
         var _loc2_:String = var_509;
         if("HabboWay1" !== _loc2_)
         {
            return "quiz." + var_509 + "." + param1;
         }
         return "habbo.way.quiz." + param1;
      }
   }
}
