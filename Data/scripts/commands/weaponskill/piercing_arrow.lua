require("global");
require("weaponskill");

function onSkillPrepare(caster, target, skill)
    return 0;
end;

function onSkillStart(caster, target, skill)
    return 0;
end;

function onSkillFinish(caster, target, skill, action, actionContainer)

    --DoAction handles rates, buffs, dealing damage
    action.DoAction(caster, target, skill, actionContainer);
end;
