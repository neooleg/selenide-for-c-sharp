using com.codeborne.selenide;
using net.sf.jni4net;
using static com.codeborne.selenide.Selenide;
using static com.codeborne.selenide.Condition;
using static com.codeborne.selenide.CollectionCondition;

namespace TestSelenideForNet
{
    class Program
    {
        static void Main(string[] args)
        {
            ConfigureJni4NetSelenide();

            open("http://google.com.ua/?hl=en");
            S("[name=q]").val("selenide").pressEnter();
            SS("#ires .g").shouldHave(size(10));
            S("#ires .g").shouldBe(visible).shouldHave(
                text("Selenide: concise UI tests in Java"),
                text("selenide.org"));
        }

        private static void ConfigureJni4NetSelenide()
        {
            var bridgeSetup = new BridgeSetup();
            bridgeSetup.Verbose = true;
            bridgeSetup.AddAllJarsClassPath(".");
            Bridge.CreateJVM(bridgeSetup);

            Bridge.RegisterAssembly(typeof(Selenide).Assembly);
        }
    }
}
