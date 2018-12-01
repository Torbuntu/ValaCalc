namespace Valacalc {

	[GtkTemplate (ui = "/org/gnome/Valacalc/window.ui")]
	public class Window : Gtk.ApplicationWindow {
		
		[GtkChild]
		Gtk.Button btn_0;
		
		[GtkChild]
		Gtk.Button btn_1;
		
		[GtkChild]
		Gtk.Button btn_2;
		
		[GtkChild]
		Gtk.Button btn_3;
		
		[GtkChild]
		Gtk.Button btn_4;
			
		[GtkChild]
		Gtk.Button btn_5;
		
		[GtkChild]
		Gtk.Button btn_6;
		
		[GtkChild]
		Gtk.Button btn_7;
		
		[GtkChild]
		Gtk.Button btn_8;
		
		[GtkChild]
		Gtk.Button btn_9;
		
		[GtkChild]
		Gtk.Button btn_divide;
		
		[GtkChild]
		Gtk.Button btn_multiply;
		
		[GtkChild]
		Gtk.Button btn_add;
		
		[GtkChild]
		Gtk.Button btn_subtract;
		
		[GtkChild]
		Gtk.Button btn_equals;
		
		[GtkChild]
		Gtk.Button btn_clear;
		
		[GtkChild]
		Gtk.Button btn_dot;
		
		[GtkChild]
		Gtk.TextView txt_display;
		
		double first_value;
		double second_value;
        bool check;
        string op;
        
        void num_button_press (string val) {
            if (check) {
              second_value = double.parse(second_value.to_string () + val);
              txt_display.buffer.text += second_value.to_string ();
            }else{
              first_value = double.parse(first_value.to_string () + val);
              txt_display.buffer.text = first_value.to_string ();
            }	
        }
        
		public Window (Gtk.Application app) {
			Object (application: app);
		    txt_display.set_wrap_mode (Gtk.WrapMode.WORD);
		    
		    check = false;
		    
		    btn_0.clicked.connect (() => {
		          num_button_press("0");
		    });
		    btn_1.clicked.connect (() => {
		          num_button_press("1");
		    });
		    btn_2.clicked.connect (() => {
		          num_button_press("2");
		    });
		    btn_3.clicked.connect (() => {
		          num_button_press("3");
		    });
		    btn_4.clicked.connect (() => {
		          num_button_press("4");
		    });
		    btn_5.clicked.connect (() => {
		          num_button_press("5");
		    });
		    btn_6.clicked.connect (() => {
		          num_button_press("6");
		    });
		    btn_7.clicked.connect (() => {
		          num_button_press("7");
		    });
		    btn_8.clicked.connect (() => {
		          num_button_press("8");
		    });
		    btn_9.clicked.connect (() => {
		          num_button_press("9");
		    });
		    btn_add.clicked.connect (() => {
		          if (check) {
		              txt_display.buffer.text = (first_value+second_value).to_string ();
		          }else{
                      op = "+";
		              txt_display.buffer.text = first_value.to_string () + op;
		              check = true;
		          }
		    });
		    btn_subtract.clicked.connect (() => {
		          if (check) {
		              txt_display.buffer.text = (first_value-second_value).to_string ();
		          }else{
		              op = "-";
		              txt_display.buffer.text = first_value.to_string () + op;
		              check = true;
		          }
		    });
		    btn_multiply.clicked.connect (() => {
		          if (check) {
		              txt_display.buffer.text = (first_value*second_value).to_string ();
		          }else{
		              op = "*";
		              txt_display.buffer.text = first_value.to_string () + op;
		              check = true;
		          }
		    });
		    btn_divide.clicked.connect (() => {
		          if (check) {
		              txt_display.buffer.text = (first_value/second_value).to_string ();
		          }else{
		              op = "/";
		              txt_display.buffer.text = first_value.to_string () + op;
		              check = true;
		          }
		    });
		    
		    btn_dot.clicked.connect (() => {
                txt_display.buffer.text += ".";
		    });
		    
		    btn_clear.clicked.connect (() => {
		        txt_display.buffer.text = "";
		        first_value = 0;
		        second_value = 0;
		        check = false;

		    });
		    
		    btn_equals.clicked.connect (() => {
		        switch (op) {
		            case "+":
		                txt_display.buffer.text = (first_value+second_value).to_string ();
		                break;
	                case "-":
		                txt_display.buffer.text = (first_value-second_value).to_string ();
		                break;
	                case "*":
		                txt_display.buffer.text = (first_value*second_value).to_string ();
		                break;
	                case "/":
		                txt_display.buffer.text = (first_value/second_value).to_string ();
		                break;
		        }
		        
		    });
        }
	}
}

