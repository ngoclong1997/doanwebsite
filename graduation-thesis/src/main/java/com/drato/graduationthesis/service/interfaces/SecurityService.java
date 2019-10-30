package com.drato.graduationthesis.service.interfaces;


import com.drato.graduationthesis.model.Role;
import com.drato.graduationthesis.model.User;

import java.util.List;

public interface SecurityService {
    public User getCurrentUser();
    public String getCurrentUsername();
    public boolean currentUserIsAdmin();
}
