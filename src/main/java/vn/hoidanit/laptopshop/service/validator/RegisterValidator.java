package vn.hoidanit.laptopshop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    public final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;
        if (user.getEmail().isEmpty()) {
            context.buildConstraintViolationWithTemplate("Email không được để trống")
                    .addPropertyNode("email")
                    .addConstraintViolation();
            valid = false;
        }
        if (user.getFirstName().isEmpty()) {
            context.buildConstraintViolationWithTemplate("Họ không được để trống")
                    .addPropertyNode("firstName")
                    .addConstraintViolation();
            valid = false;
        }
        if (user.getLastName().isEmpty()) {
            context.buildConstraintViolationWithTemplate("Tên không được để trống")
                    .addPropertyNode("lastName")
                    .addConstraintViolation();
            valid = false;
        }
        if (user.getPassword().isEmpty()) {
            context.buildConstraintViolationWithTemplate("Mật khẩu không được để trống")
                    .addPropertyNode("password")
                    .addConstraintViolation();
            valid = false;
        }
        if (user.getConfirmPass().isEmpty()) {
            context.buildConstraintViolationWithTemplate("Xác nhận mật khẩu không được để trống")
                    .addPropertyNode("confirmPass")
                    .addConstraintViolation();
            valid = false;
        } else {
            if (!user.getPassword().equals(user.getConfirmPass())) {
                context.buildConstraintViolationWithTemplate("Mật khẩu không giống nhau")
                        .addPropertyNode("confirmPass")
                        .addConstraintViolation()
                        .disableDefaultConstraintViolation();
                valid = false;
            }
        }

        // check email
        if (this.userService.checkEmailExist(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
