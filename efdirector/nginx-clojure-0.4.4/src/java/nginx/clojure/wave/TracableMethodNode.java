package nginx.clojure.wave;

import java.io.PrintWriter;

import nginx.clojure.asm.util.Printer;

public class TracableMethodNode extends InstrumentMethodNode {

	protected PrintWriter printWriter;
	protected Printer printer;
	protected String title;
	
	public TracableMethodNode(String title, MethodDatabase db, int access, String name, String desc,
			String signature, String[] exceptions, Printer printer, PrintWriter printWriter) {
		super(db, access, name, desc, signature, exceptions);
		this.printWriter = printWriter;
		this.printer = printer;
		this.title = title;
	}
	
	@Override
	public void visitCode() {
		printWriter.println("*************start of " + title +  "**************");
		super.visitCode();
	}
	
	@Override
	public void visitEnd() {
		super.visitEnd();
		printer.print(printWriter);
		printWriter.println("*************end of " + title + "**************");
		printWriter.flush();
	}

}
