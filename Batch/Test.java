import java.io.IOException;
import java.lang.Runtime;

//A Very Simple Example
class ExampleProgram {
  public static void main(String[] args){

          try {
              Runtime.getRuntime().exec("cmd /c start Test.bat");
          } catch (Exception e) {
            //  e.printStackTrace();
          }

    System.out.println("I'm a Simple Program");
  }
}
