<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
    <#elseif section = "form">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var z = document.getElementById("password-confirm");
                var v = document.getElementById("vi");
              var y = document.getElementById("vii");
                if (x.type === "password" && z.type === "password") {
                    z.type = "text";
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                    y.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    z.type = "password";
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                    y.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
        <div class="box-container">
            <div>
                <p class="application-name">Register</p>
            </div>
            <div>
               <form id="kc-form-login" class="form" action="${url.registrationAction}" method="post">
                <div class="flName" style="margin-bottom: 15px;">
                    <input id="firstName" class="login-field" style="width: 200px; margin: 0px;" type="text" name="firstName" required oninvalid="this.setCustomValidity('Enter your First Name')" oninput="this.setCustomValidity('')" value="${(register.formData.firstName!'')}" placeholder="${msg("First Name")}" tabindex="1">
                    <input id="lastName" class="login-field" style="width: 50%;" placeholder="${msg("Last Name")}" type="text" name="lastName" required oninvalid="this.setCustomValidity('Enter your Last Name')" oninput="this.setCustomValidity('')" value="${(register.formData.lastName!'')}" tabindex="1">
                </div>
                <input type="text" id="email" class="login-field" style="margin-bottom: 15px;" placeholder="${msg("Email")}" name="email"required oninvalid="this.setCustomValidity('Enter your Email')" oninput="this.setCustomValidity('')" value="${(register.formData.email!'')}" autocomplete="email" />

<#if !realm.registrationEmailAsUsername>
<input id="username" class="login-field" oninvalid="this.setCustomValidity('Enter your Username')" oninput="this.setCustomValidity('')" value="${(register.formData.username!'')}" placeholder="${msg("username")}" autocomplete="username" type="text" name="username" tabindex="1">
</#if>

<#if passwordRequired>
<div>
    <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
</div>
<input type="password" id="password" name="password" autocomplete="new-password" class="login-field" placeholder="${msg("password")}">
<div>
    <label class="visibility" id="y" onclick="togglePassword()"><img id="vii" src="${url.resourcesPath}/img/eye-off.png"></label>
</div>
<input 
type="password" id="password-confirm" class="login-field" placeholder="${msg("Confirm Password")}" name="password-confirm">
</#if>
  
<#if recaptchaRequired??>
<div class="g-recaptcha" style="margin-top: 20px;" data-sitekey="${recaptchaSiteKey}"></div>
</#if>

<input class="submit" type="submit" style="margin-top: 10px;" value="${msg("doRegister")}" tabindex="3">
</form>
</div>
</div>

<div style="text-align: center; margin-top: 10px;">
<span style="text-size:16px;">Already have an account?</span>
   <a href="${url.loginUrl}" style="text-decoration: none; color: #0055B8;">Sign In.</a>
</div>
        <div>
            <p class="copyright">&copy; Muhammad Aditya Sahrin</p>
        </div>
    </#if>
</@layout.registrationLayout>