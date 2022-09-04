package org.example.forum.dao.dto;

import lombok.Data;
import org.example.forum.dao.entity.UserRoles;

@Data
public class UserDto {
    private Integer id;
    private String userId;
    private String username;
    private String password;
    private String gender;
    private String email;
    private UserRoles role;
}
