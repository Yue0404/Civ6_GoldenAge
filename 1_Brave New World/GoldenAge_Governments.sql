--V224 每种政体政策槽
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_AUTOCRACY' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_OLIGARCHY' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_CLASSICAL_REPUBLIC' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 2 WHERE GovernmentType = 'GOVERNMENT_MONARCHY' AND GovernmentSlotType='SLOT_DIPLOMATIC';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_MONARCHY' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_MERCHANT_REPUBLIC' AND GovernmentSlotType='SLOT_MILITARY';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_MERCHANT_REPUBLIC' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_THEOCRACY' AND GovernmentSlotType='SLOT_DIPLOMATIC';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_THEOCRACY' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 2 WHERE GovernmentType = 'GOVERNMENT_COMMUNISM' AND GovernmentSlotType='SLOT_MILITARY';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_COMMUNISM' AND GovernmentSlotType='SLOT_ECONOMIC';
UPDATE Government_SlotCounts SET NumSlots = 2 WHERE GovernmentType = 'GOVERNMENT_COMMUNISM' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 2 WHERE GovernmentType = 'GOVERNMENT_DEMOCRACY' AND GovernmentSlotType='SLOT_ECONOMIC';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_DEMOCRACY' AND GovernmentSlotType='SLOT_DIPLOMATIC';
UPDATE Government_SlotCounts SET NumSlots = 2 WHERE GovernmentType = 'GOVERNMENT_DEMOCRACY' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_FASCISM' AND GovernmentSlotType='SLOT_MILITARY';
UPDATE Government_SlotCounts SET NumSlots = 2 WHERE GovernmentType = 'GOVERNMENT_FASCISM' AND GovernmentSlotType='SLOT_ECONOMIC';
UPDATE Government_SlotCounts SET NumSlots = 2 WHERE GovernmentType = 'GOVERNMENT_FASCISM' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_CORPORATE_LIBERTARIANISM' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_CORPORATE_LIBERTARIANISM' AND GovernmentSlotType='SLOT_ECONOMIC';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_CORPORATE_LIBERTARIANISM' AND GovernmentSlotType='SLOT_DIPLOMATIC';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_CORPORATE_LIBERTARIANISM' AND GovernmentSlotType='SLOT_MILITARY';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_DIGITAL_DEMOCRACY' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_DIGITAL_DEMOCRACY' AND GovernmentSlotType='SLOT_DIPLOMATIC';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_DIGITAL_DEMOCRACY' AND GovernmentSlotType='SLOT_ECONOMIC';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_DIGITAL_DEMOCRACY' AND GovernmentSlotType='SLOT_MILITARY';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_SYNTHETIC_TECHNOCRACY' AND GovernmentSlotType='SLOT_WILDCARD';
UPDATE Government_SlotCounts SET NumSlots = 3 WHERE GovernmentType = 'GOVERNMENT_SYNTHETIC_TECHNOCRACY' AND GovernmentSlotType='SLOT_MILITARY';
UPDATE Government_SlotCounts SET NumSlots = 1 WHERE GovernmentType = 'GOVERNMENT_SYNTHETIC_TECHNOCRACY' AND GovernmentSlotType='SLOT_DIPLOMATIC';

UPDATE Governments
SET OtherGovernmentIntolerance = -4
WHERE GovernmentType IN (
    'GOVERNMENT_CLASSICAL_REPUBLIC',
    'GOVERNMENT_AUTOCRACY',
    'GOVERNMENT_OLIGARCHY'
);

UPDATE Governments
SET OtherGovernmentIntolerance = -8
WHERE GovernmentType IN (
    'GOVERNMENT_MONARCHY',
    'GOVERNMENT_THEOCRACY',
    'GOVERNMENT_MERCHANT_REPUBLIC'
);

UPDATE Governments
SET OtherGovernmentIntolerance = -12
WHERE GovernmentType IN (
    'GOVERNMENT_FASCISM',
    'GOVERNMENT_COMMUNISM',
    'GOVERNMENT_DEMOCRACY'
);

UPDATE Governments
SET OtherGovernmentIntolerance = -16
WHERE GovernmentType IN (
    'GOVERNMENT_CORPORATE_LIBERTARIANISM',
    'GOVERNMENT_DIGITAL_DEMOCRACY',
    'GOVERNMENT_SYNTHETIC_TECHNOCRACY'
);

