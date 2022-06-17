package com.eshop.store.entity;

import com.eshop.store.dto.UserDto;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "User",
        uniqueConstraints = {
                @UniqueConstraint(columnNames = "email")
        })
public class User implements Serializable {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Basic
    @Column(name = "email", nullable = false, length = 45)
    private String email;

    @Basic
    @Column(name = "phone", nullable = false, length = 15)
    private String phone;

    @Basic
    @Column(name = "password", nullable = false, length = 355)
    private String password;

    @Basic
    @Column(name = "code", nullable = true, length = 45)
    private String code;

    @Basic
    @Column(name = "status", nullable = false, columnDefinition = "integer default 0")
    private Integer status;

    @Transient              // @Transient : khi query t có thể bỏ qua dòng này không query ra
    @OneToMany(mappedBy = "userId", fetch = FetchType.LAZY)
    // fetch = FetchType.LAZY : chỉ khi nào một user get role thì db mới query listRole
            List<UserRole> userRoleList;

    //    @ManyToMany(fetch = FetchType.EAGER)
//    @JoinTable(
//            name = "users_role",
//            joinColumns={@JoinColumn(name="user_id", referencedColumnName="ID")},
//            inverseJoinColumns={@JoinColumn(name="role_id", referencedColumnName="ID")}
//    )
//    private Set<Role> roles = new HashSet<>();
//    @ManyToMany(fetch = FetchType.LAZY)
//    @JoinTable(
//            name = "user_role",
//            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "ID")},
//            inverseJoinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "ID")}
//    )
//    private Set<Role> roles = new HashSet<>();
}
