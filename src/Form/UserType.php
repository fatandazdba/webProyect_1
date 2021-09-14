<?php

namespace App\Form;

use App\Entity\User;
use Doctrine\DBAL\Types\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('email', EmailType::class)
            /*->add('roles', ChoiceType::class, [
                'choices' => [
                    'ROLES_USER' => 'ROLES_USER',
                    'ROLES_ADMIN' => 'ROLES_ADMIN',
                    'ROLES_APIUPM' => 'ROLES_APIUPM',
                    'ROLES_APICHATBOT' => 'ROLES_APICHATBOT',
                ],
            ])*/


            /*->add('roles', ChoiceType::class,
                [
                    'choices' => ['ROLES_USER', 'ROLES_ADMIN']
                ]
            )*/


            //->add('roles')
            ->add('password', PasswordType::class)
            ->add('name')
            ->add('lastName')
            //->add('birthday')
            ->add('Registrar', SubmitType::class);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
