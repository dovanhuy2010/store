package com.eshop.store.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
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

        @Transient
    @OneToMany(mappedBy = "roleId", fetch = FetchType.LAZY)
    private List<UserRole> userRoleList;
//    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
//    @JoinTable(name = "role_permission",
//            joinColumns = {@JoinColumn(name = "role_id")},
//            inverseJoinColumns = {@JoinColumn(name = "permission_id")}
//    )
//    private Set<Permission> permissions = new HashSet<>();

    @Override
    public String toString() {
        return roleName;
    }
}
