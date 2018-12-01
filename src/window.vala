namespace Valacalc {

	[GtkTemplate (ui = "/org/gnome/Valacalc/window.ui")]
	public class Window : Gtk.ApplicationWindow {
		
		[GtkChild]
		Gtk.Button btn0;
		
		[GtkChild]
		Gtk.Button btn1;
		
		[GtkChild]
		Gtk.Button btn2;
		
		[GtkChild]
		Gtk.Button btn3;
		
		[GtkChild]
		Gtk.Button btn4;	
			
		[GtkChild]
		Gtk.Button btn5;
		
		[GtkChild]
		Gtk.Button btn6;
		
		[GtkChild]
		Gtk.Button btn7;
		
		[GtkChild]
		Gtk.Button btn8;
		
		[GtkChild]
		Gtk.Button btn9;
		
		[GtkChild]
		Gtk.Button btnDiv;
		
		[GtkChild]
		Gtk.Button btnMul;
		
		[GtkChild]
		Gtk.Button btnAdd;
		
		[GtkChild]
		Gtk.Button btnSub;
		
		[GtkChild]
		Gtk.Button btnEql;
		
		[GtkChild]
		Gtk.Button btnClear;
		
		[GtkChild]
		Gtk.Button btnDot;
		
		[GtkChild]
		Gtk.TextView txtDisplay;
		
		double firstVal;
		double secondVal;
        bool check;
        string op;
        
        void numButtonPress(string val){
            if(check){
              secondVal = double.parse(secondVal.to_string() + val);
              txtDisplay.buffer.text += secondVal.to_string();
            }else{
              firstVal = double.parse(firstVal.to_string() + val);
              txtDisplay.buffer.text = firstVal.to_string();
            }	
        }
        
		public Window (Gtk.Application app) {
			Object (application: app);
		    txtDisplay.set_wrap_mode (Gtk.WrapMode.WORD);
		    
		    check = false;
		    
		    btn0.clicked.connect(() => {
		          numButtonPress("0");	          
		    });
		    btn1.clicked.connect(() => {
		          numButtonPress("1");		
		    });
		    btn2.clicked.connect(() => {
		          numButtonPress("2");	
		    });
		    btn3.clicked.connect(() => {
		          numButtonPress("3");	
		    });
		    btn4.clicked.connect(() => {
		          numButtonPress("4");	
		    });
		    btn5.clicked.connect(() => {
		          numButtonPress("5");	
		    });
		    btn6.clicked.connect(() => {
		          numButtonPress("6");	
		    });
		    btn7.clicked.connect(() => {
		          numButtonPress("7");
		    });
		    btn8.clicked.connect(() => {
		          numButtonPress("8");	
		    });
		    btn9.clicked.connect(() => {
		          numButtonPress("9");	
		    });
		    btnAdd.clicked.connect(() => {
		          if(check){
		              txtDisplay.buffer.text = (firstVal+secondVal).to_string();
		          }else{
                      op = "+";
		              txtDisplay.buffer.text = firstVal.to_string() + op;
		              check = true;
		          }
		    });
		    btnSub.clicked.connect(() => {
		          if(check){
		              txtDisplay.buffer.text = (firstVal-secondVal).to_string();
		          }else{
		              op = "-";
		              txtDisplay.buffer.text = firstVal.to_string() + op;
		              check = true;
		          }
		    });
		    btnMul.clicked.connect(() => {
		          if(check){
		              txtDisplay.buffer.text = (firstVal*secondVal).to_string();
		          }else{
		              op = "*";
		              txtDisplay.buffer.text = firstVal.to_string() + op;
		              check = true;
		          }
		    });
		    btnDiv.clicked.connect(() => {
		          if(check){
		              txtDisplay.buffer.text = (firstVal/secondVal).to_string();
		          }else{
		              op = "/";
		              txtDisplay.buffer.text = firstVal.to_string() + op;
		              check = true;
		          }
		    });
		    
		    btnDot.clicked.connect(() => {
                txtDisplay.buffer.text += "."; 
		    });
		    
		    btnClear.clicked.connect(() => {
		        txtDisplay.buffer.text = "";		    
		    });
		    
		    btnEql.clicked.connect(() => {
		        switch (op){
		            case "+":
		                txtDisplay.buffer.text = (firstVal+secondVal).to_string();
		                break;
	                case "-":
		                txtDisplay.buffer.text = (firstVal-secondVal).to_string();
		                break;
	                case "*":
		                txtDisplay.buffer.text = (firstVal*secondVal).to_string();
		                break;
	                case "/":
		                txtDisplay.buffer.text = (firstVal/secondVal).to_string();
		                break;
		        }
		        
		    });
        }
	}
}

