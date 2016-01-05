using com.codeborne.selenide;
using net.sf.jni4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestSelenideForNet
{
    class Program
    {
        static void Main(string[] args)
        {
            var bridgeSetup = new BridgeSetup();
            bridgeSetup.Verbose = true;
            bridgeSetup.AddAllJarsClassPath(".");
            Bridge.CreateJVM(bridgeSetup);
            Bridge.RegisterAssembly(typeof(Selenide).Assembly);

            Selenide.open("http://google.com/ncr");
        }
    }
}
