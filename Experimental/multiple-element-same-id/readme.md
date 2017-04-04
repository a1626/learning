This project is to test return `hashById` and `querySelector` of Polymer.

# Conclusion

- In case of `hasById` always last element will be returned.
- In case of `querySelector` always first element will be returned, doesn't matter whether it's inside `dom-if` or not.
- In case there is only one `dom-if` it's value will be returned by `querySelector` irrespective of value of `if` and `restamp`.
- These results also hold for `shadow-dom V0`.