import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Main {
  public static void main(String[] args) throws Exception {
    String s = "{1,2,{3,4},{5,6},{7,{8,{9}}},10}";
    ANTLRInputStream input = new ANTLRInputStream(s);
    ArrayInitLexer lexer = new ArrayInitLexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ArrayInitParser parser = new ArrayInitParser(tokens);
    ParseTree tree = parser.init();
    System.out.println("Array:" + s);
    System.out.println("ParseTree:" + tree.toStringTree());
  }
}
