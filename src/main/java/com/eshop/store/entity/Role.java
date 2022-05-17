package com.eshop.store.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "role")
public class Role implements Serializable {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Basic
    @Column(name = "name", nullable = false, length = 20)
    private String roleName;

    @OneToMany(mappedBy = "role")
    @JsonBackReference
    private Set<User> users = new HashSet<User>();

    @Override
    public String toString() {

        return roleName;
//        return "Role{" +
//                "role=" + role +
//                ", roleName='" + roleName + '\'' +
//                ", users=" + users +
//                '}';
    }
}
