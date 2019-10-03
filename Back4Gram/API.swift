//  This file was automatically generated and should not be edited.

import Apollo

public final class SignUpUserMutation: GraphQLMutation {
  /// mutation signUpUser($username: String!, $password: String!, $email: String) {
  ///   users {
  ///     __typename
  ///     signUp(fields: {username: $username, password: $password, email: $email}) {
  ///       __typename
  ///       objectId
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation signUpUser($username: String!, $password: String!, $email: String) { users { __typename signUp(fields: {username: $username, password: $password, email: $email}) { __typename objectId } } }"

  public let operationName = "signUpUser"

  public var username: String
  public var password: String
  public var email: String?

  public init(username: String, password: String, email: String? = nil) {
    self.username = username
    self.password = password
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["username": username, "password": password, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .object(User.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "users": users.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// This is the top level for users mutations.
    public var users: User? {
      get {
        return (resultMap["users"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["UsersMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("signUp", arguments: ["fields": ["username": GraphQLVariable("username"), "password": GraphQLVariable("password"), "email": GraphQLVariable("email")]], type: .nonNull(.object(SignUp.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(signUp: SignUp) {
        self.init(unsafeResultMap: ["__typename": "UsersMutation", "signUp": signUp.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The signUp mutation can be used to sign the user up.
      public var signUp: SignUp {
        get {
          return SignUp(unsafeResultMap: resultMap["signUp"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "signUp")
        }
      }

      public struct SignUp: GraphQLSelectionSet {
        public static let possibleTypes = ["SignUpResult"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("objectId", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(objectId: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "SignUpResult", "objectId": objectId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// This is the object id.
        public var objectId: GraphQLID {
          get {
            return resultMap["objectId"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "objectId")
          }
        }
      }
    }
  }
}

public final class LogInUserMutation: GraphQLMutation {
  /// mutation logInUser($username: String!, $password: String!) {
  ///   users {
  ///     __typename
  ///     logIn(username: $username, password: $password) {
  ///       __typename
  ///       sessionToken
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation logInUser($username: String!, $password: String!) { users { __typename logIn(username: $username, password: $password) { __typename sessionToken } } }"

  public let operationName = "logInUser"

  public var username: String
  public var password: String

  public init(username: String, password: String) {
    self.username = username
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["username": username, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .object(User.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "users": users.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// This is the top level for users mutations.
    public var users: User? {
      get {
        return (resultMap["users"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["UsersMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logIn", arguments: ["username": GraphQLVariable("username"), "password": GraphQLVariable("password")], type: .nonNull(.object(LogIn.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(logIn: LogIn) {
        self.init(unsafeResultMap: ["__typename": "UsersMutation", "logIn": logIn.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The logIn mutation can be used to log the user in.
      public var logIn: LogIn {
        get {
          return LogIn(unsafeResultMap: resultMap["logIn"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "logIn")
        }
      }

      public struct LogIn: GraphQLSelectionSet {
        public static let possibleTypes = ["Me"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("sessionToken", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(sessionToken: String) {
          self.init(unsafeResultMap: ["__typename": "Me", "sessionToken": sessionToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The user session token
        public var sessionToken: String {
          get {
            return resultMap["sessionToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sessionToken")
          }
        }
      }
    }
  }
}

public final class LogOutUserMutation: GraphQLMutation {
  /// mutation logOutUser {
  ///   users {
  ///     __typename
  ///     logOut
  ///   }
  /// }
  public let operationDefinition =
    "mutation logOutUser { users { __typename logOut } }"

  public let operationName = "logOutUser"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .object(User.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "users": users.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// This is the top level for users mutations.
    public var users: User? {
      get {
        return (resultMap["users"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["UsersMutation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("logOut", type: .nonNull(.scalar(Bool.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(logOut: Bool) {
        self.init(unsafeResultMap: ["__typename": "UsersMutation", "logOut": logOut])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The logOut mutation can be used to log the user out.
      public var logOut: Bool {
        get {
          return resultMap["logOut"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "logOut")
        }
      }
    }
  }
}
