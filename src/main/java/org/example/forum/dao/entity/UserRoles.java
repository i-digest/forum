package org.example.forum.dao.entity;

public enum UserRoles {
    ADMINISTRATOR("administrator"),
    USER("user");
    private final String role;

    UserRoles(final String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return this.role;
    }
}
