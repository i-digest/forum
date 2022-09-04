package org.example.forum.service;

import lombok.SneakyThrows;
import org.example.forum.dao.dto.UserDto;
import org.example.forum.dao.entity.User;
import org.example.forum.dao.entity.UserRoles;
import org.example.forum.dao.repository.UserRepository;
import org.example.forum.mapper.UserEntityToDtoMapper;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final UserEntityToDtoMapper userEntityToDtoMapper;
    private final MessageDigest messageDigest;

    @SneakyThrows
    public UserService(final UserRepository userRepository, final UserEntityToDtoMapper userEntityToDtoMapper) {
        this.userRepository = userRepository;
        this.userEntityToDtoMapper = userEntityToDtoMapper;
        this.messageDigest = MessageDigest.getInstance("SHA1");
    }

    public void save(@NonNull final UserDto userDto) {
        final String password = userDto.getPassword();
        final String encryptedPassword = getEncryptedPassword(password);
        userDto.setPassword(encryptedPassword);
        userDto.setRole(UserRoles.USER);
        this.userRepository.save(this.userEntityToDtoMapper.toEntity(userDto));
    }

    public int signIn(@NonNull final String userId, @NonNull final String password) {
        final Optional<User> optional = this.userRepository.findUserByUserId(userId);
        if (optional.isEmpty()) {
            return -1;
        } else {
            final User user = optional.get();
            final String encryptedPassword = getEncryptedPassword(password);
            if (!encryptedPassword.equals(user.getPassword())) {
                return 0;
            } else {
                return 1;
            }
        }
    }

    @Nullable
    public UserDto findByUserId(@NonNull final String userId) {
        return this.userRepository.findUserByUserId(userId)
                .map(this.userEntityToDtoMapper::toDto)
                .orElse(null);
    }

    private String getEncryptedPassword(final String password) {
        this.messageDigest.update(password.getBytes());
        final byte[] bytes = this.messageDigest.digest();
        final StringBuilder stringBuilder = new StringBuilder();
        for (final byte aByte : bytes) {
            stringBuilder.append(Integer.toString((aByte & 0xff) + 0x100, 16).substring(1));
        }

        return stringBuilder.toString();
    }
}
