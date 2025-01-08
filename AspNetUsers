CREATE TABLE public."AspNetUsers" (
    "Id" VARCHAR(450) NOT NULL,
    "NombreCompleto" TEXT,
    "UserName" VARCHAR(256),
    "NormalizedUserName" VARCHAR(256),
    "Email" VARCHAR(256),
    "NormalizedEmail" VARCHAR(256),
    "EmailConfirmed" BOOLEAN NOT NULL,
    "PasswordHash" TEXT,
    "SecurityStamp" TEXT,
    "ConcurrencyStamp" TEXT,
    "PhoneNumber" TEXT,
    "PhoneNumberConfirmed" BOOLEAN NOT NULL,
    "TwoFactorEnabled" BOOLEAN NOT NULL,
    "LockoutEnd" TIMESTAMPTZ,
    "LockoutEnabled" BOOLEAN NOT NULL,
    "AccessFailedCount" INT NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE INDEX "EmailIndex" ON public."AspNetUsers" ("NormalizedEmail");

CREATE UNIQUE INDEX "UserNameIndex" ON public."AspNetUsers" ("NormalizedUserName")
WHERE "NormalizedUserName" IS NOT NULL;

CREATE TABLE public."AspNetUserTokens" (
    "UserId" VARCHAR(450) NOT NULL,
    "LoginProvider" VARCHAR(450) NOT NULL,
    "Name" VARCHAR(450) NOT NULL,
    "Value" TEXT,
    PRIMARY KEY ("UserId", "LoginProvider", "Name"),
    CONSTRAINT "FK_AspNetUserTokens_AspNetUsers" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers" ("Id") ON DELETE CASCADE
);

CREATE TABLE public."AspNetRoles" (
    "Id" VARCHAR(450) NOT NULL,
    "Name" VARCHAR(256),
    "NormalizedName" VARCHAR(256),
    "ConcurrencyStamp" TEXT,
    PRIMARY KEY ("Id")
);

CREATE UNIQUE INDEX "RoleNameIndex" ON public."AspNetRoles" ("NormalizedName")
WHERE "NormalizedName" IS NOT NULL;

CREATE TABLE public."AspNetUserRoles" (
    "UserId" VARCHAR(450) NOT NULL,
    "RoleId" VARCHAR(450) NOT NULL,
    PRIMARY KEY ("UserId", "RoleId"),
    CONSTRAINT "FK_AspNetUserRoles_AspNetUsers" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_AspNetUserRoles_AspNetRoles" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON public."AspNetUserRoles" ("RoleId");

CREATE TABLE public."AspNetUserLogins" (
    "LoginProvider" VARCHAR(450) NOT NULL,
    "ProviderKey" VARCHAR(450) NOT NULL,
    "ProviderDisplayName" TEXT,
    "UserId" VARCHAR(450) NOT NULL,
    PRIMARY KEY ("LoginProvider", "ProviderKey"),
    CONSTRAINT "FK_AspNetUserLogins_AspNetUsers" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers" ("Id") ON DELETE CASCADE
);

CREATE TABLE public."AspNetRoleClaims" (
    "Id" SERIAL PRIMARY KEY,
    "RoleId" VARCHAR(450) NOT NULL,
    "ClaimType" TEXT,
    "ClaimValue" TEXT,
    CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON public."AspNetRoleClaims" ("RoleId");

CREATE TABLE public."AspNetUserClaims" (
    "Id" SERIAL PRIMARY KEY,
    "UserId" VARCHAR(450) NOT NULL,
    "ClaimType" TEXT,
    "ClaimValue" TEXT,
    CONSTRAINT "FK_AspNetUserClaims_AspNetUsers" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_AspNetUserClaims_UserId" ON public."AspNetUserClaims" ("UserId");
