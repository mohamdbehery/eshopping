using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Linq;
using eShopping.Web.APIs.App_Start;
using eShopping.Web.APIs.Core;
using Helper;

namespace eShopping.Web.APIs.Provider
{
    public class OAuthAppProvider : OAuthAuthorizationServerProvider
    {
        private Dictionary<string, string> Additional;
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            //if (context.ClientId == null)
            //{
            context.Validated();
            //}
            //return Task.FromResult<object>(null);
        }
        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            if (Additional != null)
            {
                foreach (var row in Additional)
                    context.AdditionalResponseParameters.Add(row.Key, row.Value);
            }
            return base.TokenEndpoint(context);
        }

        public override Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var utilities = new Utilities();

            return Task.Factory.StartNew(() =>
            {
                var userName = context.UserName;
                var password = context.Password;
                var user = BusinessHelper.CheckLoginUser(userName, password);
                if (user != null)
                {
                    var claims = new List<Claim>()
                    {
                        new Claim(ClaimTypes.Email, user.Email)
                        , new Claim(ClaimTypes.Role, user.UserGroup)
                        , new Claim(ClaimTypes.Sid,user.UserID.ToString())
                    };
                    if (!string.IsNullOrEmpty(user.FullName))
                        claims.Add(new Claim(ClaimTypes.Name, user.FullName));
                    if (!string.IsNullOrEmpty(user.Picture))
                        claims.Add(new Claim(ClaimTypes.PostalCode, user.Picture.ToString()));

                    var identity = new ClaimsIdentity(claims, Startup.OAuthOptions.AuthenticationType);
                    Additional = new Dictionary<string, string>();
                    Additional.Add("Role", user.UserGroup);
                    Additional.Add("Name", user.FullName);
                    Additional.Add("UserID", user.UserID.ToString());

                    if (!string.IsNullOrEmpty(user.Picture))
                        Additional.Add("Picture", user.Picture.ToString());
                    context.Validated(new AuthenticationTicket(identity, new AuthenticationProperties() { }));
                }
                else
                {
                    context.SetError("invalid_login", "invalid user name or password");
                }
            });
        }
    }


}