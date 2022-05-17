package com.eshop.store.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "User")
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

    // Many to One
    @ManyToOne
    @JoinColumn(name = "id_Role", referencedColumnName = "id")
    @JsonBackReference
    // thông qua khóa ngoại
    private Role role;
}
