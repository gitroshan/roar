package com.roshan.webapp.controller;

import java.io.InputStream;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.roshan.model.User;

/**
 * 
 * @author roshan
 *
 */
@Controller
@RequestMapping("/profilepicture*")
@SuppressWarnings("nls")
public class ProfilePictureController extends BaseFormController {

    public ProfilePictureController() {
        setCancelView("redirect:/home");
        setSuccessView("redirect:/home");
    }

    @ModelAttribute
    @RequestMapping(method = RequestMethod.GET)
    public ProfilePicture showForm() {

        return new ProfilePicture();
    }

    @RequestMapping(method = RequestMethod.POST)
    public String onSubmit(ProfilePicture profilePicture, BindingResult errors, HttpServletRequest request,
            Locale locale) throws Exception {

        if (request.getParameter("cancel") != null) {
            return getCancelView();
        }

        if (profilePicture.getPicture() == null || profilePicture.getPicture().length == 0) {
            errors.rejectValue("picture", "error.profile.picture.empty");
            return "profilepicture";
        }

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("picture");

        try (InputStream input = file.getInputStream()) {

            if (!isValidImage(errors, input)) {
                errors.rejectValue("picture", "error.profile.picture.invalid");
                return "profilepicture";
            }

            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            user.setProfilePicture(file.getBytes());

            getUserManager().saveUser(user);

            saveMessage(request, getText("update.profile.picture.success.message", locale));

            Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(),
                    user.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);

            user = getUserManager().getUserByUsername(user.getUsername());

            request.getSession().setAttribute("testImage", new String(Base64.encodeBase64(user.getProfilePicture())));

        } catch (Exception e) {

            this.log.error(e.getMessage(), e);
            saveError(request, getText("update.profile.picture.error.message", locale));
        }

        return getSuccessView();
    }

    /**
     * Checks if is valid image.
     *
     * @param errors the errors
     * @param input the input
     * @return true, if is valid image
     */
    private boolean isValidImage(BindingResult errors, InputStream input) {
        try {
            ImageIO.read(input).toString();
            return true;
        } catch (Exception e) {
            this.log.error(e.getMessage(), e);
            return false;
        }
    }
}
