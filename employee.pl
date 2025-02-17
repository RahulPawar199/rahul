#!/usr/bin/perl
use strict;
use warnings;

# Parent Class: Employee
package Employee;

sub new {
    my ($class, $name, $salary) = @_;
    my $self = {
        _name   => $name,
        _salary => $salary,
    };
    bless $self, $class;
    return $self;
}

sub get_name {
    my ($self) = @_;
    return $self->{_name};
}

sub get_salary {
    my ($self) = @_;
    return $self->{_salary};
}

sub show_details {
    my ($self) = @_;
    return "Employee: " . $self->get_name() . ", Salary: " . $self->get_salary();
}

# Subclass: Manager (inherits from Employee)
package Manager;
use parent -norequire, 'Employee';

sub new {
    my ($class, $name, $salary, $bonus) = @_;
    my $self = $class->SUPER::new($name, $salary);
    $self->{_bonus} = $bonus;
    bless $self, $class;
    return $self;
}

sub get_bonus {
    my ($self) = @_;
    return $self->{_bonus};
}

sub show_details {
    my ($self) = @_;
    return $self->SUPER::show_details() . ", Bonus: " . $self->get_bonus();
}

# Main Execution
package main;

my $employee = Employee->new("John Doe", 50000);
print $employee->show_details(), "\n";

my $manager = Manager->new("Alice Smith", 80000, 15000);
print $manager->show_details(), "\n";
