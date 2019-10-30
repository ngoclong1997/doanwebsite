package com.drato.graduationthesis.dto;

import com.drato.graduationthesis.annotation.FieldMatch;

import javax.validation.constraints.*;

@FieldMatch.List({
        @FieldMatch(firstField = "password", secondField = "confirmPassword", message = "Hai mật khẩu không giống nhau")
})
public class UserDto {

    @NotEmpty(message = "Trường này không được bỏ trống")
    @Size(min = 3, max = 50, message = "Trường này phải lớn hơn 4 và nhỏ hơn 50 ký tự")
    private String username;

    @NotEmpty(message = "Trường này không được bỏ trống")
    @Size(max = 50, message = "Trường này phải nhỏ hơn 50 ký tự")
    private String firstName;

    @NotEmpty(message = "Trường này không được bỏ trống")
    @Size(max = 50, message = "Trường này phải nhỏ hơn 50 ký tự")
    private String lastName;

    @NotEmpty(message = "Trường này không được bỏ trống")
    @Size(min=6, max = 50, message = "Trường này phải lớn hơn 6 và nhỏ hơn 50 ký tự")
    private String password;

    @NotEmpty(message = "Trường này không được bỏ trống")
    @Size(min=6, max = 50, message = "Trường này phải lớn hơn 6 và nhỏ hơn 50 ký tự")
    private String confirmPassword;

    @Email
    @NotEmpty(message = "Trường này không được bỏ trống")
    @Size(min=6, max = 50, message = "Trường này phải lớn hơn 6 và nhỏ hơn 50 ký tự")
    private String email;

    @NotEmpty(message = "Trường này không @được bỏ trống")
    private String role;

    public UserDto() {
    }

    public UserDto(@NotEmpty(message = "Trường này không được bỏ trống") @Size(min = 3, max = 50, message = "Trường này phải lớn hơn 4 và nhỏ hơn 50 ký tự") String username, @NotEmpty(message = "Trường này không được bỏ trống") @Size(max = 50, message = "Trường này phải nhỏ hơn 50 ký tự") String firstName, @NotEmpty(message = "Trường này không được bỏ trống") @Size(max = 50, message = "Trường này phải nhỏ hơn 50 ký tự") String lastName, @NotEmpty(message = "Trường này không được bỏ trống") @Size(min = 6, max = 50, message = "Trường này phải lớn hơn 6 và nhỏ hơn 50 ký tự") String password, @NotEmpty(message = "Trường này không được bỏ trống") @Size(min = 6, max = 50, message = "Trường này phải lớn hơn 6 và nhỏ hơn 50 ký tự") String confirmPassword, @Email @NotEmpty(message = "Trường này không được bỏ trống") @Size(min = 6, max = 50, message = "Trường này phải lớn hơn 6 và nhỏ hơn 50 ký tự") String email, @NotEmpty(message = "Trường này không @được bỏ trống") String role) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.email = email;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
