using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AtThisPoint.Startup))]
namespace AtThisPoint
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
