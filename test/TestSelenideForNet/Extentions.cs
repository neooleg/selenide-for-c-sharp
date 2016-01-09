using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using com.codeborne.selenide;

namespace TestSelenideForNet
{
    public static class ElementsCollectionEx
    {
        public static ElementsCollection shouldHave(this ElementsCollection inst, CollectionCondition par0)
        {
            return inst.shouldHave(new CollectionCondition[] { par0 });
        }
    }
    public static class SelenideElementEx
    {
        public static SelenideElement shouldBe(this SelenideElement inst, Condition par0)
        {
            return inst.shouldBe(new Condition[] { par0 });
        }
        public static SelenideElement shouldHave(this SelenideElement inst, Condition par0, Condition par1)
        {
            return inst.shouldHave(new Condition[] { par0, par1 });
        }
    }
}
